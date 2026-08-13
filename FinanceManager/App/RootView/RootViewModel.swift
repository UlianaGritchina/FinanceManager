//
//  RootViewModel.swift
//  FinanceManager
//
//  Created by Ульяна Гритчина on 13.08.2026.
//

import AppSession
import Foundation

final class RootViewModel {
    let sessionManager: SessionManager
    
    init(sessionManager: SessionManager) {
        self.sessionManager = sessionManager
    }
    
    func restoreSession() async {
        let _ = await sessionManager.restoreSession()
    }
}
