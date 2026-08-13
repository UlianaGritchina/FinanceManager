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

struct RegisterView: View {
    @State private var viewModel: RegisterViewModel
    
    init(viewModel: RegisterViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
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
                            CreateNewAccountView(
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
//                await viewModel.getAccountInfo()
            }
        }
    }
}
