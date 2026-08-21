//
//  AccountView.swift
//  Account
//
//  Created by Ульяна Гритчина on 20.08.2026.
//

import SwiftUI

public struct AccountView: View {
    @State private var viewModel: AccountViewModel
    
    public init(viewModel: AccountViewModel) {
        self.viewModel = viewModel
    }
    
    public var body: some View {
        NavigationStack {
            ScrollView {
                Text(viewModel.userName)
                Button("Delete") {
                    Task {
                        await viewModel.deleteButtonTapped()
                    }
                }
            }
            .navigationTitle("Account")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                viewModel.setUserInfo()
            }
        }
    }
}
