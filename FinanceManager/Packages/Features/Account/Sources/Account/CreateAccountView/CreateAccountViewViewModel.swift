//
//  CreateAccountViewViewModel.swift
//  FinanceManager
//
//  Created by Ульяна Гритчина on 30.07.2026.
//

import AppSession
import AccountDomain
import AuthorizationDomain
import Core
import Foundation

@Observable
public final class CreateAccountViewViewModel {
    private let sessionManager: SessionManager
    
    public init(sessionManager: SessionManager) {
        self.sessionManager = sessionManager
    }
    
    var email = ""
    var password = ""
    var account: Account?
    
    @MainActor
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
        try await sessionManager.register(
            name: credentials.name,
            password: credentials.password
        )
    }
    
    private func createNewAccount() async throws {
        account = try await sessionManager.createUserAccount(name: email)
    }
}
