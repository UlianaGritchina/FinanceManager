//
//  RegisterViewModel.swift
//  FinanceManager
//
//  Created by Ульяна Гритчина on 25.07.2026.
//

import AppSession
import AuthorizationDomain
import AccountDomain
import Core
import Foundation
import Account

@Observable
public final class WelcomeViewModel {
    private let sessionManager: SessionManager
    let createAccountViewModel: CreateAccountViewViewModel
    
    var email: String = ""
    var password: String = ""
    var accountInfo: Account?
    
    public init(
        sessionManager: SessionManager,
        createAccountViewModel: CreateAccountViewViewModel
    ) {
        self.sessionManager = sessionManager
        self.createAccountViewModel = createAccountViewModel
    }
    
    @MainActor
    func loginButtonTapped() async {
        do {
            try await login()
        } catch {
            print(error)
        }
    }
    
    @MainActor
    func createAccountButtonTapped() async {
        do {
            try await createUserAccount()
        } catch {
            print(error)
        }
    }
    
    @MainActor
    func deleteButtonTapped() async {
        do {
            try await delete()
        } catch {
            print(error)
        }
    }
   
    @MainActor
    private func login() async throws {
        let userName = try UserName(email)
        let password = try Password(password)
        try await sessionManager.login(name: userName, password: password)
        await getAccountInfo()
    }
    
    @MainActor
    func getAccountInfo() async {
        accountInfo = await sessionManager.account
    }
    
    @MainActor
    private func createUserAccount() async throws {
        let _ = try await sessionManager.createUserAccount(name: email)
    }
    
    @MainActor
    private func delete() async throws {
        try await sessionManager.delete()
    }
}
