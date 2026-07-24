//
//  File.swift
//  Authorization
//
//  Created by Ульяна Гритчина on 24.07.2026.
//

import Foundation

@Observable
final class LoginViewModel {
    var isOpenRegisterView = false
    
    func openRegisterView() {
        isOpenRegisterView = true
    }
}
