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
            let welcomeVM = resolver.resolve(WelcomeViewModel.self)!
            let homeVM = resolver.resolve(HomeViewModel.self)!
            
            return RootViewModel(
                sessionManager: resolver.resolve(SessionManager.self)!,
                welcomeViewModel: welcomeVM,
                homeViewModel: homeVM
            )
        }
        .inObjectScope(.container)
    }
}

