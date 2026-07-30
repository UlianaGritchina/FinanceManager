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
final class RegisterViewModel {
    private let keychainStorage: KeychainStorage
    private let authRepository: AuthRepository
    private let accountRepository: AccountRepository
    
    let createAccountViewModel: CreateNewAccountViewModel
    
    var email: String = ""
    var password: String = ""
    
    init(
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
}
