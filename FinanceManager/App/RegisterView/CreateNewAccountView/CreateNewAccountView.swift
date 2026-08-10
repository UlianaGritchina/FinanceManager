//
//  CreateNewAccountView.swift
//  FinanceManager
//
//  Created by Ульяна Гритчина on 30.07.2026.
//

import AccountDomain
import SwiftUI

struct CreateNewAccountView: View {
    @State private var viewModel: CreateNewAccountViewModel
    
    init(viewModel: CreateNewAccountViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        @Bindable var vm = viewModel
        NavigationView {
            ScrollView {
                if let account = viewModel.account {
                    Text("\(account.userName): \(account.balance)")
                } else {
                    VStack {
                        TextField("email", text: $vm.email)
                        TextField("password", text: $vm.password)
                        
                        Button("Create account") {
                            viewModel.createAccountButtonTapped()
                        }
                    }
                    .padding()
                }
            }
        }
    }
}
