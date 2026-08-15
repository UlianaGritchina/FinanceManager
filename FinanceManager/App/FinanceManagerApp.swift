//
//  FinanceManagerApp.swift
//  FinanceManager
//
//  Created by Ульяна Гритчина on 21.07.2026.
//

import AppDI
import Authorization
import SwiftUI
import Swinject
import RootView

@main
struct FinanceManagerApp: App {
    var body: some Scene {
        WindowGroup {
            RootView(
                viewModel: AppAssembler.shared.resolver.resolve(RootViewModel.self)!
            )
        }
    }
}
