//
//  AppAssembler.swift
//  FinanceManager
//
//  Created by Ульяна Гритчина on 23.07.2026.
//

import AppSession
import Authorization
import Core
import Foundation
import Account
import Home
import Swinject
import RootView
import WelcomeView

@MainActor
public enum AppAssembler {
    static public let shared = Assembler([
        RootAssembly(),
        CoreAssembly(),
        AuthAssembly(),
        WelcomeViewAssembly(),
        AccountAssembly(),
        SessionAssembly(),
        HomeAssembly()
    ])
}

