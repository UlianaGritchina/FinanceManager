//
//  RootViewModel.swift
//  FinanceManager
//
//  Created by Ульяна Гритчина on 25.07.2026.
//

import Authorization
import Core
import Foundation
import Profile

@Observable
final class RootViewModel {
    private let keychainStorage: KeychainStorage
    
    let authFactory: AuthFactory
    let profileFactory: ProfileFactory
    
    var isShowLoginView = true
    
    init(
        authFactory: AuthFactory,
        profileFactory: ProfileFactory,
        keychainStorage: KeychainStorage
    ) {
        self.authFactory = authFactory
        self.keychainStorage = keychainStorage
        self.profileFactory = profileFactory
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
