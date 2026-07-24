//
//  AuthorisationView.swift
//  Auth
//
//  Created by Ульяна Гритчина on 23.07.2026.
//

import SwiftUI

struct RegisterView: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var viewModel: RegisterViewModel
    
    init(viewModel: RegisterViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        @Bindable var vm = viewModel
        NavigationView {
            ScrollView {
                VStack {
                    TextField("email", text: $vm.email)
                        .padding()
                    
                    TextField("password", text: $vm.password)
                        .padding()
                    
                    Button(action: {
                        viewModel.createAccountButtonTapped()
                    }) {
                        Text("Create")
                    }
                }
            }
            .navigationTitle("Create Account")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button(action: { dismiss() }) {
                        Image(systemName: "xmark")
                    }
                }
            }
        }
    }
}

//#Preview {
//    RegisterView()
//}
