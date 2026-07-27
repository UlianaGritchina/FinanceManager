//
//  File.swift
//  Profile
//
//  Created by Ульяна Гритчина on 27.07.2026.
//

import Foundation
import SwiftUI
import Swinject

public protocol ProfileFactory {
    func makeProfileView() -> AnyView
}

public final class ProfileFactoryImpl: @preconcurrency ProfileFactory {
    private let resolver: Resolver
    
    public init(resolver: Resolver) {
        self.resolver = resolver
    }
    
    @MainActor
    public func makeProfileView() -> AnyView {
        let profileViewModel = resolver.resolve(ProfileViewModel.self)!
        return AnyView(
            ProfileView(viewModel: profileViewModel)
        )
    }
}
