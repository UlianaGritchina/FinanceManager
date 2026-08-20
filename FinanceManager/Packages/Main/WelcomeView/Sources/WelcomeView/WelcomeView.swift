//
//  RootView.swift
//  FinanceManager
//
//  Created by Ульяна Гритчина on 23.07.2026.
//

import Authorization
import AccountDomain
import Swinject
import SwiftUI
import Account

public struct WelcomeView: View {
    @State private var viewModel: WelcomeViewModel
    
    public init(viewModel: WelcomeViewModel) {
        self.viewModel = viewModel
    }
    
    public var body: some View {
        @Bindable var vm = viewModel
        NavigationView {
            ScrollView {
                VStack {
                    Text("Finance Manager")
                    
                    if let account = viewModel.accountInfo {
                        Text("\(account.userName): \(account.balance)")
                        Button("Delete") {
                            Task {
                                await viewModel.deleteButtonTapped()
                            }
                        }
                    } else {
                        
                        TextField("email", text: $vm.email)
                        TextField("password", text: $vm.password)
                        
                        Button("Login") {
                            Task {
                                await viewModel.loginButtonTapped()
                            }
                        }
                        
                        NavigationLink {
                            CreateAccountView(
                                viewModel: viewModel.createAccountViewModel
                            )
                        } label: {
                            Text("Register")
                        }
                    }
                }
                .padding()
            }
            .task {
                await viewModel.getAccountInfo()
            }
        }
    }
}
