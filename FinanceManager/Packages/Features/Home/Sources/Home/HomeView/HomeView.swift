//
//  HomeView.swift
//  Home
//
//  Created by Ульяна Гритчина on 17.08.2026.
//

import Account
import SwiftUI

public struct HomeView: View {
    @State private var viewModel: HomeViewModel
    
    public init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
    }
    
    public var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    Text("Balance: \(viewModel.balance)")
                        .font(.title3)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Button("Open account") {
                        viewModel.showAccountView()
                    }
                }
                .padding()
            }
            .navigationTitle(viewModel.userName)
            .navigationBarTitleDisplayMode(.inline)
            .sheet(isPresented: $viewModel.isShowAccountView, content: {
                AccountView(viewModel: viewModel.accountViewModel)
            })
            .onAppear {
                viewModel.setUserInfo()
            }
        }
    }
}
