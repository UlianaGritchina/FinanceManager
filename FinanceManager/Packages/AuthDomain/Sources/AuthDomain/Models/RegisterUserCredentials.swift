//
//  RegisterUserCredentials.swift
//  AuthDomain
//
//  Created by Ульяна Гритчина on 21.07.2026.
//

import Foundation

public struct RegisterUserCredentials: Sendable {
    public let name: UserName
    public let password: Password
    
    public init(name: UserName, password: Password) {
        self.name = name
        self.password = password
    }
}
