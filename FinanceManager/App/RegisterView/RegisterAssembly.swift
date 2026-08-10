//
//  RootAssembly.swift
//  FinanceManager
//
//  Created by Ульяна Гритчина on 25.07.2026.
//

import Authorization
import AuthorizationDomain
import AccountDomain
import Core
import Foundation
import Account
import Swinject

final class RegisterAssembly: Assembly {
    func assemble(container: Container) {
        container.register(RegisterViewModel.self) { resolver in
            RegisterViewModel(
                keychainStorage: resolver.resolve(KeychainStorage.self)!,
                authRepository: resolver.resolve(AuthRepository.self)!,
                accountRepository: resolver.resolve(AccountRepository.self)!,
                createAccountViewModel: resolver.resolve(CreateNewAccountViewModel.self)!
            )
        }
        
        container.register(CreateNewAccountViewModel.self) { resolver in
            CreateNewAccountViewModel(
                keychainStorage: resolver.resolve(KeychainStorage.self)!,
                authRepository: resolver.resolve(AuthRepository.self)!,
                accountRepository: resolver.resolve(AccountRepository.self)!
            )
        }
    }
}
