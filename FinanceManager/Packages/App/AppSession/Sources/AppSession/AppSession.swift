import AccountDomain
import AuthorizationDomain
import Core
import SwiftUI

public actor SessionManager {
    public enum State: Sendable {
        case loading
        case unauthorised
        case needsAccount
        case authorised
    }
    
    public private(set) var state: State = .loading
    public private(set) var account: Account?
    
    private let authRepository: AuthRepository
    private let accountRepository: AccountRepository
    private let keychainStorage: KeychainStorage
    
    public init(
        authRepository: AuthRepository,
        accountRepository: AccountRepository,
        keychainStorage: KeychainStorage
    ) {
        self.authRepository = authRepository
        self.accountRepository = accountRepository
        self.keychainStorage = keychainStorage
    }
    
    public func register(name: UserName, password: Password) async throws {
        let credentials = RegisterUserCredentials(
            name: name,
            password: password
        )
        
        let session = try await authRepository.register(user: credentials)
        
        try saveSession(session)
        state = .needsAccount
    }
    
    public func login(name: UserName, password: Password) async throws {
        let _ = try await authRepository.login(
            user: RegisterUserCredentials(
                name: name,
                password: password
            )
        )
        state = .authorised
    }
    
    public func getAccountInfo() async throws -> Account? {
        let account = try await accountRepository.getAccount(by: userId)
        return account
    }
    
    public func createUserAccount(name: String) async throws -> Account {
        let user = UserInfo(
            id: UUID().uuidString,
            name: name,
            balance: 0,
            currencyId: "d67bdffe-9f2d-45e4-809a-c566f537dfb7"
        )
        let account = try await accountRepository.createAccount(user: user)
        try keychainStorage.save(account.id, for: .accountId)
        state = .authorised
        return account
    }
    
    public func delete() async throws {
        let userId: String = try keychainStorage.get(for: .accountId)
        try await accountRepository.delete(id: userId)
        try await authRepository.delete()
        try keychainStorage.delete(for: .accessToken)
        try keychainStorage.delete(for: .refreshToken)
        try keychainStorage.delete(for: .registerUserCredentials)
        state = .unauthorised
    }
    
    public func restoreSession() async {
        do {
            let refreshToken: String = try keychainStorage.get(
                for: .refreshToken
            )
            
            let session = try await authRepository.refreshSession(
                refreshToken: refreshToken
            )

            try saveSession(session)

            account = try await getAccountInfo()
            state = .authorised
        } catch {
            state = .unauthorised
        }
    }
    
    private func saveSession(_ session: AuthSession) throws {
        try keychainStorage.save(session.accessToken.value, for: .accessToken)
        try keychainStorage.save(session.refreshToken.value, for: .refreshToken)
    }
}
