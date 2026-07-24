//
//  File.swift
//  Auth
//
//  Created by Ульяна Гритчина on 23.07.2026.
//

import AuthorizationDomain
import AuthorizationData
import Foundation

@Observable
public final class RegisterViewModel {
    private let authRepository: AuthRepository
    
    var email: String = ""
    var password: String = ""
    
    public init(authRepository: AuthRepository) {
        self.authRepository = authRepository
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
        let token = try await authRepository.register(user: credentials)
        print(token)
    }
}
