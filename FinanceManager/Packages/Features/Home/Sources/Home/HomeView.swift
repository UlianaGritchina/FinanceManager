//
//  HomeView.swift
//  Home
//
//  Created by Ульяна Гритчина on 17.08.2026.
//

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
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            }
            .navigationTitle(viewModel.userName)
            .navigationBarTitleDisplayMode(.inline)
            .task {
                viewModel.setUserInfo()
            }
        }
    }
}
