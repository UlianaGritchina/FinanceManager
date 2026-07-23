//
//  WelcomeView.swift
//  Auth
//
//  Created by Ульяна Гритчина on 23.07.2026.
//

import Swinject
import SwiftUI

public struct WelcomeView: View {

    private let resolver: Resolver

    public init(resolver: Resolver) {
        self.resolver = resolver
    }

    public var body: some View {
        NavigationStack {
            VStack {
                Text("Finance Manager")
                NavigationLink {
                    RegisterView(viewModel: resolver.resolve(RegisterViewModel.self)!)
                } label: {
                    Text("Create account")
                }
            }
        }
    }
}
