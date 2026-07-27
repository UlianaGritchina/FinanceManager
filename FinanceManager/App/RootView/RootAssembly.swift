//
//  RootAssembly.swift
//  FinanceManager
//
//  Created by Ульяна Гритчина on 25.07.2026.
//

import Authorization
import Core
import Foundation
import Profile
import Swinject

final class RootAssembly: Assembly {
    func assemble(container: Container) {
        container.register(RootViewModel.self) { resolver in
            RootViewModel(
                authFactory: resolver.resolve(AuthFactory.self)!,
                profileFactory: resolver.resolve(ProfileFactory.self)!,
                keychainStorage: resolver.resolve(KeychainStorage.self)!
            )
        }
    }
}
