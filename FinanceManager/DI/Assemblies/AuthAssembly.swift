//
//  AuthAssembly.swift
//  FinanceManager
//
//  Created by Ульяна Гритчина on 23.07.2026.
//

import Authorization
import AuthorizationData
import AuthorizationDomain
import Core
import Swinject
import Foundation

final class AuthAssembly: Assembly {
    func assemble(container: Container) {
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
    }
}
