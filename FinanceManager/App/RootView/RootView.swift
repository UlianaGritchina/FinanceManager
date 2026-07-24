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
    let authFactory: AuthFactory
    var body: some View {
        authFactory.makeLoginView()
    }
}
