//
//  RootViewModel.swift
//  FinanceManager
//
//  Created by Ульяна Гритчина on 13.08.2026.
//

import AppSession
import Foundation
import WelcomeView

@Observable
public final class RootViewModel {
    let sessionManager: SessionManager
    let welcomeViewModel: WelcomeViewModel
    var sessionState: SessionManager.State = .loading
    
    public init(sessionManager: SessionManager, welcomeViewModel: WelcomeViewModel) {
        self.sessionManager = sessionManager
        self.welcomeViewModel = welcomeViewModel
    }
    
    @MainActor
    func restoreSession() async {
        let _ = await sessionManager.restoreSession()
        sessionState = await sessionManager.state
    }
}
