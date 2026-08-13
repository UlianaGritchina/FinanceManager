//
//  RootView.swift
//  FinanceManager
//
//  Created by Ульяна Гритчина on 13.08.2026.
//

import AppSession
import SwiftUI
import Swinject

struct RootView: View {
    @State private var viewModel: RootViewModel
    
    init(viewModel: RootViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        Group {
            switch viewModel.sessionManager.state {
            case .loading:
                Text("loading")
                
            case .authorised:
                VStack {
                    Text("authorised")
                    RegisterView(viewModel: AppAssembler.shared.resolver.resolve(RegisterViewModel.self)!)
                }
            case .needsAccount:
                Text("needsAccount")
                
            case .unauthorised:
                RegisterView(viewModel: AppAssembler.shared.resolver.resolve(RegisterViewModel.self)!)
            }
        }
        .task {
            await viewModel.restoreSession()
        }
    }
}
