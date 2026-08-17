//
//  File.swift
//  AppSession
//
//  Created by Ульяна Гритчина on 13.08.2026.
//

import AuthorizationDomain
import AccountDomain
import Core
import Foundation
import Swinject

final public class SessionAssembly: Assembly {
    
    public init() { }
    
    public func assemble(container: Container) {
        container.register(SessionManager.self) { resolver in
            SessionManager(
                authRepository: resolver.resolve(AuthRepository.self)!,
                accountRepository: resolver.resolve(AccountRepository.self)!,
                keychainStorage: resolver.resolve(KeychainStorage.self)!
            )
        }
        .inObjectScope(.container)
    }
}
