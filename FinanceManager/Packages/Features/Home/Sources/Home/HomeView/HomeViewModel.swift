//
//  HomeViewModel.swift
//  Home
//
//  Created by Ульяна Гритчина on 17.08.2026.
//

import Account
import AccountDomain
import AppSession
import Foundation

@Observable
public final class HomeViewModel {
    private let sessionManager: SessionManager
    
    let accountViewModel: AccountViewModel

    private var account: Account?
    
    var isShowAccountView = false
    
    public init(sessionManager: SessionManager, accountViewModel: AccountViewModel) {
        self.sessionManager = sessionManager
        self.accountViewModel = accountViewModel
    }
    
    var userName: String {
        account?.userName ?? ""
    }
    
    var balance: Int {
        account?.balance ?? 0
    }
    
    @MainActor
    func setUserInfo() {
        Task {
            account = await sessionManager.account
        }
    }
    
    func showAccountView() {
        isShowAccountView = true
    }
}
