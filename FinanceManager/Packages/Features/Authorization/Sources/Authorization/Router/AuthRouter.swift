//
//  File.swift
//  Authorization
//
//  Created by Ульяна Гритчина on 24.07.2026.
//

import SwiftUI
import Swinject

protocol AuthRouter {
    func makeRegisterView() -> AnyView
}

final class AuthRouterImpl: @preconcurrency AuthRouter {
    private let resolver: Resolver

    init(resolver: Resolver) {
        self.resolver = resolver
    }

    @MainActor func makeRegisterView() -> AnyView {
        let registerViewModel = resolver.resolve(RegisterViewModel.self)!
        
        return AnyView(RegisterView(viewModel: registerViewModel))
    }
}
