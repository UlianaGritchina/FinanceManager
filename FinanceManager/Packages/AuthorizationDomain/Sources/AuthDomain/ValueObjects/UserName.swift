//
//  UserName.swift
//  AuthDomain
//
//  Created by Ульяна Гритчина on 21.07.2026.
//

import Foundation

public struct UserName: Sendable {
    public let value: String
    
    public init(_ value: String?) throws {
        guard let value, !value.isEmpty else {
            throw ValidationError.wrongValue
        }
        
        self.value = value
    }
}
