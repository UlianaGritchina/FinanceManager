//
//  File.swift
//  Authorization
//
//  Created by Ульяна Гритчина on 24.07.2026.
//

import Swinject
import AuthorizationDomain
import SwiftUI

public protocol AuthFactory {
    func makeLoginView() -> AnyView
    func makeRegisterView() -> AnyView
}

public final class AuthFactoryImpl: @preconcurrency AuthFactory {
    private let resolver: Resolver
    
    public init(resolver: Resolver) {
        self.resolver = resolver
    }
    
    @MainActor
    public func makeLoginView() -> AnyView {
        AnyView(LoginView(router: AuthRouterImpl(resolver: resolver)))
    }
    
    @MainActor
    public func makeRegisterView() -> AnyView {
        let viewModel = resolver.resolve(RegisterViewModel.self)!
        return AnyView(RegisterView(viewModel: viewModel))
    }
}

