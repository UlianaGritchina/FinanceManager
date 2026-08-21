//
//  CreateAccountView.swift
//  FinanceManager
//
//  Created by Ульяна Гритчина on 30.07.2026.
//

import AccountDomain
import SwiftUI

public struct CreateAccountView: View {
    @State private var viewModel: CreateAccountViewViewModel
    
    public init(viewModel: CreateAccountViewViewModel) {
        self.viewModel = viewModel
    }
    
    public var body: some View {
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
