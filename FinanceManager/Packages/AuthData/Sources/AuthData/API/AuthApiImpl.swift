//
//  AuthApiImpl.swift
//  AuthData
//
//  Created by Ульяна Гритчина on 22.07.2026.
//

import Core
import Foundation

actor AuthApiImpl: AuthAPI {
    private let networkClient: NetworkClient = NetworkClientImpl(baseURL: URL(string:"http://yourflow.pro")!)
    
    func registerNewUser(_ user: AuthUserDTO) async throws -> AuthTokenResponseDTO {
        let endPoint = AuthEndpoint.registerNewUser(user)
        
        return try await networkClient.request(endPoint)
    }
    
    func login(_ user: AuthUserDTO) async throws -> AuthTokenResponseDTO {
        let endPoint = AuthEndpoint.login(user)
        
        return try await networkClient.request(endPoint)
    }
    
    func refreshUser(refreshToken: RefreshTokenDTO) async throws -> AuthTokenResponseDTO {
        let endPoint = AuthEndpoint.refreshUser(refreshToken)
        return try await networkClient.request(endPoint)
    }
    
    func logOut() async throws {
        try await networkClient.request(AuthEndpoint.logOut)
    }
    
    func deleteUser() async throws {
        try await networkClient.request(AuthEndpoint.deleteUser)
    }
}
