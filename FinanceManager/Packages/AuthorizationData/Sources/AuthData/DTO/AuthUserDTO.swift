//
//  AuthUserDTO.swift
//  AuthData
//
//  Created by Ульяна Гритчина on 22.07.2026.
//

import Foundation

public struct AuthUserDTO: Codable {
    let name: String
    let password: String
    
    public init(name: String, password: String) {
        self.name = name
        self.password = password
    }
}
