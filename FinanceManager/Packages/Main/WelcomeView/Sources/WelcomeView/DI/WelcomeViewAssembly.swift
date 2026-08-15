//
//  WelcomeViewAssembly.swift
//  FinanceManager
//
//  Created by Ульяна Гритчина on 25.07.2026.
//

import Authorization
import AuthorizationDomain
import AccountDomain
import Account
import Core
import Foundation
import Account
import Swinject

public final class WelcomeViewAssembly: Assembly {
    
    public init() { }
    
    public func assemble(container: Container) {
        container.register(WelcomeViewModel.self) { resolver in
            WelcomeViewModel(
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
