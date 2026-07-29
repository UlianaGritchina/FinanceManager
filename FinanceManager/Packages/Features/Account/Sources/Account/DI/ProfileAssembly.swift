//
//  File.swift
//  Account
//
//  Created by Ульяна Гритчина on 27.07.2026.
//

import Core
import AccountData
import AccountDomain
import Foundation
import Swinject

final public class AccountAssembly: Assembly {
    public init() { }
    
    public func assemble(container: Container) {
        container.register(AccountAPI.self) { resolver in
            AccountApiImpl(
                networkClient: resolver.resolve(NetworkClient.self)!
            )
        }
        
        container.register(AccountRepository.self) { resolver in
            let accountAPI = resolver.resolve(AccountAPI.self)!
            return AccountRepositoryImpl(accountAPI: accountAPI)
        }
    }
}
