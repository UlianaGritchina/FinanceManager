//
//  WelcomeViewAssembly.swift
//  FinanceManager
//
//  Created by Ульяна Гритчина on 25.07.2026.
//

import AppSession
import AccountDomain
import Account
import Authorization
import AuthorizationDomain
import AppSession
import Core
import Foundation
import Account
import Swinject

public final class WelcomeViewAssembly: Assembly {
    
    public init() { }
    
    public func assemble(container: Container) {
        container.register(WelcomeViewModel.self) { resolver in
            WelcomeViewModel(
                sessionManager: resolver.resolve(SessionManager.self)!,
                createAccountViewModel: resolver.resolve(CreateAccountViewViewModel.self)!
            )
        }
        
        container.register(CreateAccountViewViewModel.self) { resolver in
            CreateAccountViewViewModel(
                sessionManager: resolver.resolve(SessionManager.self)!
            )
        }
    }
}
