//
//  AuthSession.swift
//  AuthDomain
//
//  Created by Ульяна Гритчина on 21.07.2026.
//

import Foundation

public struct AuthSession: Sendable {
    public init(accessToken: AccessToken, refreshToken: RefreshToken) {
        self.accessToken = accessToken
        self.refreshToken = refreshToken
    }
    
    public let accessToken: AccessToken
    public let refreshToken: RefreshToken
}
