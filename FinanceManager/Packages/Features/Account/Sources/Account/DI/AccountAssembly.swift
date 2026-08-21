//
//  AccountAssembly.swift
//  Account
//
//  Created by Ульяна Гритчина on 27.07.2026.
//

import AppSession
import AccountData
import AccountDomain
import Core
import Swinject

final public class AccountAssembly: Assembly {
    public init() { }
    
    public func assemble(container: Container) {
        container.register(AccountAPI.self) { resolver in
            AccountApiImpl(
                networkClient: resolver.resolve(NetworkClient.self)!
            )
        }
        
        container.register(AccountViewModel.self) { resolver in
            AccountViewModel(sessionManager: resolver.resolve(SessionManager.self)!)
        }
        
        container.register(AccountRepository.self) { resolver in
            let accountAPI = resolver.resolve(AccountAPI.self)!
            return AccountRepositoryImpl(accountAPI: accountAPI)
        }
    }
}
