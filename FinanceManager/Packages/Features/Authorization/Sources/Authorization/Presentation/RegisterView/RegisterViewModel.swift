//
//  File.swift
//  Auth
//
//  Created by Ульяна Гритчина on 23.07.2026.
//

import AuthorizationDomain
import AuthorizationData
import Core
import Foundation

@Observable
public final class RegisterViewModel {
    private let authRepository: AuthRepository
    private let keyChainStorage: KeychainStorage
    
    var email: String = ""
    var password: String = ""
    
    public init(authRepository: AuthRepository, keyChainStorage: KeychainStorage) {
        self.authRepository = authRepository
        self.keyChainStorage = keyChainStorage
    }
    
    @MainActor
    func createAccountButtonTapped() {
        Task {
            do {
                try await createAccount()
            } catch {
                print(error)
            }
        }
    }
    
    private func createAccount() async throws {
        let userName = try UserName(email)
        let password = try Password(password)
        let credentials = RegisterUserCredentials(name: userName, password: password)
        let session = try await authRepository.register(user: credentials)
        try saveSession(session)
    }
    
    private func saveSession(_ session: AuthSession) throws {
        try keyChainStorage.save(session.accessToken.value, for: .accessToken)
        try keyChainStorage.save(session.refreshToken.value, for: .refreshToken)
    }
}
