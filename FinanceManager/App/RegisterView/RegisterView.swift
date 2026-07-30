//
//  RootView.swift
//  FinanceManager
//
//  Created by Ульяна Гритчина on 23.07.2026.
//

import Authorization
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
                    
                    TextField("email", text: $vm.email)
                    TextField("password", text: $vm.password)
                    
                    Button("Login") {
                        
                    }
                    
                    NavigationLink {
                        CreateNewAccountView(
                            viewModel: viewModel.createAccountViewModel
                        )
                    } label: {
                        Text("Register")
                    }
                }
                .padding()
            }
        }
    }
}
