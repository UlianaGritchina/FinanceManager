//
//  FinanceManagerApp.swift
//  FinanceManager
//
//  Created by Ульяна Гритчина on 21.07.2026.
//

import Authorization
import SwiftUI
import Swinject

@main
struct FinanceManagerApp: App {
    let appAssembly = AppAssembler.shared
    var body: some Scene {
        WindowGroup {
            RootView(
                viewModel: appAssembly.resolver.resolve(RootViewModel.self)!
            )
        }
    }
}
