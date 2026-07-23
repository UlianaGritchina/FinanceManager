//
//  AppAssembler.swift
//  FinanceManager
//
//  Created by Ульяна Гритчина on 23.07.2026.
//

import Foundation
import Swinject

enum AppAssembler {
    static let shared = Assembler([
        CoreAssembly(),
        AuthAssembly()
    ])
}

