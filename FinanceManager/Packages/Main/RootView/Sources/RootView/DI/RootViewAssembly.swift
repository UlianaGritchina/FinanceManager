//
//  RootViewAssembly.swift
//  FinanceManager
//
//  Created by Ульяна Гритчина on 13.08.2026.
//

import Core
import AppSession
import Account
import AccountDomain
import AuthorizationDomain
import Foundation
import Home
import Swinject
import WelcomeView

final public class RootAssembly: Assembly {
    
    public init() { }
    
    public func assemble(container: Container) {
        container.register(RootViewModel.self) { resolver in
            let keychain = resolver.resolve(KeychainStorage.self)!
            let authRepository = resolver.resolve(AuthRepository.self)!
            let accountRepository = resolver.resolve(AccountRepository.self)!
            let createAccountViewModel = resolver.resolve(CreateNewAccountViewModel.self)!
            let sessionManager = resolver.resolve(SessionManager.self)!
            
            let welcomeVM = WelcomeViewModel(
                keychainStorage: keychain,
                authRepository: authRepository,
                accountRepository: accountRepository,
                createAccountViewModel: createAccountViewModel
            )
            
            let homeVM = HomeViewModel(sessionManager: sessionManager)
            
            return RootViewModel(
                sessionManager: resolver.resolve(SessionManager.self)!,
                welcomeViewModel: welcomeVM,
                homeViewModel: homeVM
            )
        }
        .inObjectScope(.container)
    }
}

