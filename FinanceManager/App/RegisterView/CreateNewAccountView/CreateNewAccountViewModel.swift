//
//  CreateNewAccountViewModel.swift
//  FinanceManager
//
//  Created by Ульяна Гритчина on 30.07.2026.
//

import AccountDomain
import AuthorizationDomain
import Core
import Foundation

@Observable
final class CreateNewAccountViewModel {
    private let keychainStorage: KeychainStorage
    private let authRepository: AuthRepository
    private let accountRepository: AccountRepository
    
    init(
        keychainStorage: KeychainStorage,
        authRepository: AuthRepository,
        accountRepository: AccountRepository
    ) {
        self.keychainStorage = keychainStorage
        self.authRepository = authRepository
        self.accountRepository = accountRepository
    }
    
    var email = ""
    var password = ""
    var account: AccountInfo?
    
    func createAccountButtonTapped() {
        Task {
            do {
                try await registerNewUser()
                try await createNewAccount()
            } catch {
                print(error)
            }
        }
    }
    
    private func registerNewUser() async throws {
        let credentials = RegisterUserCredentials(
            name: try UserName(email),
            password: try Password(password)
        )
        let session = try await authRepository.register(user: credentials)
        try keychainStorage.save(session.accessToken.value, for: .accessToken)
        try keychainStorage.save(session.refreshToken.value, for: .refreshToken)
        print(session)
    }
    
    private func createNewAccount() async throws {
        let userInfo = UserInfo(
            id: UUID().uuidString.lowercased(),
            name: email,
            balance: 0,
            currencyId: "3fa85f64-5717-4562-b3fc-2c963f66afa6"
        )
        let accountInfo = try await accountRepository.createAccount(user: userInfo)
        self.account = accountInfo
    }
}
