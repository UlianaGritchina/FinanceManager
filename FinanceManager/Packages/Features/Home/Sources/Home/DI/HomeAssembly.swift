//
//  File.swift
//  Home
//
//  Created by Ульяна Гритчина on 20.08.2026.
//

import Account
import AppSession
import Foundation
import Swinject

public final class HomeAssembly: Assembly {
    public init() { }
    
    public func assemble(container: Container) {
        container.register(HomeViewModel.self) { resolver in
            HomeViewModel(
                sessionManager: resolver.resolve(SessionManager.self)!,
                accountViewModel: resolver.resolve(AccountViewModel.self)!
            )
        }
    }
}
