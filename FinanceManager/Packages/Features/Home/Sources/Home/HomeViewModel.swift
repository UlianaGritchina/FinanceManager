//
//  HomeViewModel.swift
//  Home
//
//  Created by Ульяна Гритчина on 17.08.2026.
//

import AccountDomain
import AppSession
import Foundation

@Observable
public final class HomeViewModel {
    let sessionManager: SessionManager
    
    private var account: Account?
    
    public init(sessionManager: SessionManager) {
        self.sessionManager = sessionManager
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
}
