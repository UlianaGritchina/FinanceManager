//
//  AuthAssembly.swift
//  FinanceManager
//
//  Created by Ульяна Гритчина on 23.07.2026.
//

import AuthorizationData
import AuthorizationDomain
import Core
import Swinject
import Foundation

public final class AuthAssembly: Assembly {
    public init() { }
    
    public func assemble(container: Container) {
        container.register(AuthAPI.self) { resolver in
            AuthApiImpl(
                networkClient: resolver.resolve(NetworkClient.self)!
            )
        }
        
        container.register(AuthRepository.self) { resolver in
            AuthRepositoryImpl(
                authAPI: resolver.resolve(AuthAPI.self)!
            )
        }
        
        container.register(RegisterViewModel.self) { resolver in
            RegisterViewModel(authRepository: resolver.resolve(AuthRepository.self)!)
        }

        container.register(AuthFactory.self) { resolver in
            AuthFactoryImpl(resolver: resolver)
        }
    }
}
