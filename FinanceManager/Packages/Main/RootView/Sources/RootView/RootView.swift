//
//  RootView.swift
//  FinanceManager
//
//  Created by Ульяна Гритчина on 13.08.2026.
//

import AppSession
import SwiftUI
import Swinject
import Home
import WelcomeView
import MainTabView

public struct RootView: View {
    @State private var viewModel: RootViewModel
    
    public init(viewModel: RootViewModel) {
        self.viewModel = viewModel
    }
    
    public var body: some View {
        VStack {
            switch viewModel.sessionState {
            case .loading:
                Text("loading")
                
            case .authorised:
                MainTabView(homeViewModel: viewModel.homeViewModel)
            
            case .needsAccount:
                Text("needsAccount")
                
            case .unauthorised:
                WelcomeView(viewModel: viewModel.welcomeViewModel)
            }
        }
        .task {
            await viewModel.restoreSession()
        }
    }
}
