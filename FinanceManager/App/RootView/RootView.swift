//
//  RootView.swift
//  FinanceManager
//
//  Created by Ульяна Гритчина on 23.07.2026.
//

import Authorization
import Swinject
import SwiftUI

struct RootView: View {
    @State private var viewModel: RootViewModel
    
    init(viewModel: RootViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack {
            if viewModel.isShowLoginView {
                viewModel.authFactory.makeLoginView()
            } else {
                Text("user registered")
            }
        }
    }
}
