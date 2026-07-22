//
//  AuthRepositoryImpl.swift
//  AuthData
//
//  Created by Ульяна Гритчина on 22.07.2026.
//

import AuthDomain
import Foundation

final class AuthRepositoryImpl: AuthRepository {
    private let authAPI: AuthAPI
    
    init(authAPI: AuthAPI) {
        self.authAPI = authAPI
    }
    
    func register(user: RegisterUserCredentials) async throws -> AuthSession {
        let userDTO = AuthUserDTO(
            name: user.userName.value,
            password: user.password.value
        )
        
        let authTokenResponse = try await authAPI.registerNewUser(userDTO)
        
        return try authTokenResponse.toDomain()
    }
    
    func login(user: RegisterUserCredentials) async throws -> AuthSession {
        let userDTO = AuthUserDTO(
            name: user.userName.value,
            password: user.password.value
        )
        
        let authTokenResponse = try await authAPI.login(userDTO)
        
        return try authTokenResponse.toDomain()
    }
    
    func delete() async throws {
        try await authAPI.deleteUser()
    }
}
