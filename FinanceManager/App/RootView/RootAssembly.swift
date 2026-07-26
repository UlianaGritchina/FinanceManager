//
//  RootAssembly.swift
//  FinanceManager
//
//  Created by Ульяна Гритчина on 25.07.2026.
//

import Authorization
import Core
import Swinject
import Foundation

final class RootAssembly: Assembly {
    func assemble(container: Container) {
        container.register(RootViewModel.self) { resolver in
            RootViewModel(
                authFactory: resolver.resolve(AuthFactory.self)!,
                keychainStorage: resolver.resolve(KeychainStorage.self)!
            )
        }
    }
}
