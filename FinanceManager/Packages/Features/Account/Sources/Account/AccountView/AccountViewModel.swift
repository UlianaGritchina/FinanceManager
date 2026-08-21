//
//  File.swift
//  Account
//
//  Created by Ульяна Гритчина on 20.08.2026.
//

import AccountDomain
import AppSession
import Foundation

@Observable
public final class AccountViewModel {
    private let sessionManager: SessionManager
    
    private var account: Account?
    
    public init(sessionManager: SessionManager) {
        self.sessionManager = sessionManager
    }
    
    var userName: String {
        account?.userName ?? ""
    }
    
    @MainActor
    func setUserInfo() {
        Task {
            account = await sessionManager.account
        }
    }
    
    @MainActor
    func deleteButtonTapped() async {
        do {
            try await sessionManager.delete()
        } catch {
            print("Error")
        }
    }
}
