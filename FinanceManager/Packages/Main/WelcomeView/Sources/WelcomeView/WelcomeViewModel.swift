//
//  RegisterViewModel.swift
//  FinanceManager
//
//  Created by Ульяна Гритчина on 25.07.2026.
//

import AuthorizationDomain
import AccountDomain
import Core
import Foundation
import Account

@Observable
public final class WelcomeViewModel {
    private let keychainStorage: KeychainStorage
    private let authRepository: AuthRepository
    private let accountRepository: AccountRepository
    
    let createAccountViewModel: CreateNewAccountViewModel
    
    var email: String = ""
    var password: String = ""
    var accountInfo: Account?
    
    public init(
        keychainStorage: KeychainStorage,
        authRepository: AuthRepository,
        accountRepository: AccountRepository,
        createAccountViewModel: CreateNewAccountViewModel
    ) {
        self.keychainStorage = keychainStorage
        self.authRepository = authRepository
        self.accountRepository = accountRepository
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
        
        let _ = try await authRepository.login(
            user: RegisterUserCredentials(
                name: userName,
                password: password
            )
        )
        await getAccountInfo()
    }
    
    @MainActor
    func getAccountInfo() async {
        do {
            let userId: String = try keychainStorage.get(for: .userID)
            let account = try await accountRepository.getAccount(by: userId)
            accountInfo = account
        } catch {
            
        }
    }
    
    @MainActor
    private func createUserAccount() async throws {
        let user = UserInfo(
            id: UUID().uuidString,
            name: "Q",
            balance: 0,
            currencyId: "d67bdffe-9f2d-45e4-809a-c566f537dfb7"
        )
        let _ = try await accountRepository.createAccount(user: user)
    }
    
    @MainActor
    private func delete() async throws {
        let userId: String = try keychainStorage.get(for: .userID)
        try await accountRepository.delete(id: userId)
        try await authRepository.delete()
        accountInfo = nil
        try keychainStorage.delete(for: .accessToken)
        try keychainStorage.delete(for: .refreshToken)
        try keychainStorage.delete(for: .registerUserCredentials)
    }
}
