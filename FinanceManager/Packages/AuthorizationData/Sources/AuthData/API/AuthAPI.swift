//
//  AuthAPI.swift
//  AuthData
//
//  Created by Ульяна Гритчина on 21.07.2026.
//

import Foundation

public protocol AuthAPI: Sendable {
    func registerNewUser(_ user: AuthUserDTO) async throws -> AuthTokenResponseDTO
    func login(_ user: AuthUserDTO) async throws -> AuthTokenResponseDTO
    func refreshUser(refreshToken: RefreshTokenDTO) async throws -> AuthTokenResponseDTO
    func logOut() async throws
    func deleteUser() async throws
}

