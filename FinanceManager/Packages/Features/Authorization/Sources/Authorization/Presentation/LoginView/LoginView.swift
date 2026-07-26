//
//  LoginView.swift
//  Auth
//
//  Created by Ульяна Гритчина on 23.07.2026.
//

import SwiftUI

public struct LoginView: View {
    @State private var viewModel = LoginViewModel()
    
    let router: AuthRouter
    
    init(router: AuthRouter) {
        self.router = router
    }
    
    public var body: some View {
        @Bindable var vm = viewModel
        NavigationStack {
            VStack {
                Text("Finance Manager")
                Button(action: { viewModel.openRegisterView() }) {
                    Text("Create account")
                }
            }
            .fullScreenCover(isPresented: $vm.isOpenRegisterView) {
                router.makeRegisterView()
            }
        }
    }
}
