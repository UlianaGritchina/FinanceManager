//
//  AuthTokenResponseDTO.swift
//  AuthData
//
//  Created by Ульяна Гритчина on 22.07.2026.
//

import AuthDomain
import Foundation

struct AuthTokenResponseDTO: Decodable {
    let accessToken: String
    let refreshToken: String
}

extension AuthTokenResponseDTO {
    func toDomain() throws -> AuthSession {
        AuthSession(
            accessToken: try AccessToken(accessToken),
            refreshToken: try RefreshToken(refreshToken)
        )
    }
}
