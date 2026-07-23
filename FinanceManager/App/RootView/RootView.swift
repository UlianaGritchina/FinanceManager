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
    var body: some View {
        WelcomeView(resolver: AppAssembler.shared.resolver)
    }
}

#Preview {
    RootView()
}
