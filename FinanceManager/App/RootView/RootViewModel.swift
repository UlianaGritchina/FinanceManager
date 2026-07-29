//
//  RootViewModel.swift
//  FinanceManager
//
//  Created by Ульяна Гритчина on 25.07.2026.
//

import Authorization
import Core
import Foundation
import Account

@Observable
final class RootViewModel {
    private let keychainStorage: KeychainStorage
    
    var isShowLoginView = true
    
    init(
        keychainStorage: KeychainStorage
    ) {
        self.keychainStorage = keychainStorage
        checkAuthSession()
    }
    
    private func checkAuthSession() {
        do {
            let accessToken: String = try keychainStorage.get(for: .accessToken)
            isShowLoginView = false
            print(accessToken)
        } catch {
            print(error)
        }
    }
}
