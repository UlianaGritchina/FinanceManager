//
//  RootViewAssembly.swift
//  FinanceManager
//
//  Created by Ульяна Гритчина on 13.08.2026.
//

import AppSession
import Foundation
import Swinject


final public class RootAssembly: Assembly {
    
    public init() { }
    
    public func assemble(container: Container) {
        container.register(RootViewModel.self) { resolver in
            RootViewModel(sessionManager: resolver.resolve(SessionManager.self)!)
        }
        .inObjectScope(.container)
    }
}

