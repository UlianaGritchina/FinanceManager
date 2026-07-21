//
//  RefreshToken.swift
//  AuthDomain
//
//  Created by Ульяна Гритчина on 21.07.2026.
//

struct RefreshToken {
    let value: String
    
    init(_ value: String?) throws {
        guard let value, !value.isEmpty else {
            throw ValidationError.wrongValue
        }
        self.value = value
    }
}
