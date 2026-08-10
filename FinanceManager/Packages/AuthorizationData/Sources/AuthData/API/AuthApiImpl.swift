//
//  AuthApiImpl.swift
//  AuthData
//
//  Created by Ульяна Гритчина on 22.07.2026.
//

import Core
import Foundation

public final class AuthApiImpl: AuthAPI, Sendable {
    private let networkClient: NetworkClient
    
    public init(networkClient: NetworkClient) {
        self.networkClient = networkClient
    }
    
    public func registerNewUser(_ user: AuthUserDTO) async throws -> AuthTokenResponseDTO {
        let endPoint = AuthEndpoint.registerNewUser(user)
        
        return try await networkClient.request(endPoint)
    }
    
    public func login(_ user: AuthUserDTO) async throws -> AuthTokenResponseDTO {
        let endPoint = AuthEndpoint.login(user)
        
        return try await networkClient.request(endPoint)
    }
    
    public func refreshUser(refreshToken: RefreshTokenDTO) async throws -> AuthTokenResponseDTO {
        let endPoint = AuthEndpoint.refreshUser(refreshToken)
        return try await networkClient.request(endPoint)
    }
    
    public func logOut() async throws {
        try await networkClient.request(AuthEndpoint.logOut)
    }
    
    public func deleteUser() async throws {
        try await networkClient.request(AuthEndpoint.deleteUser)
    }
}
