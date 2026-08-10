//
//  AuthRepositoryImpl.swift
//  AuthData
//
//  Created by Ульяна Гритчина on 22.07.2026.
//

import AuthorizationDomain
import Foundation

public final class AuthRepositoryImpl: AuthRepository, Sendable {
    private let authAPI: AuthAPI
    
    public init(authAPI: AuthAPI) {
        self.authAPI = authAPI
    }
    
    public func register(user: RegisterUserCredentials) async throws -> AuthSession {
        let userDTO = AuthUserDTO(
            name: user.name.value,
            password: user.password.value
        )
        
        let authTokenResponse = try await authAPI.registerNewUser(userDTO)
        
        return try authTokenResponse.toDomain()
    }
    
    public func login(user: RegisterUserCredentials) async throws -> AuthSession {
        let userDTO = AuthUserDTO(
            name: user.name.value,
            password: user.password.value
        )
        
        let authTokenResponse = try await authAPI.login(userDTO)
        
        return try authTokenResponse.toDomain()
    }
    
    public func delete() async throws {
        try await authAPI.deleteUser()
    }
}
