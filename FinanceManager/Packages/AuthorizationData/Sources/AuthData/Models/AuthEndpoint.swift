//
//  AuthEndpoint.swift
//  AuthData
//
//  Created by Ульяна Гритчина on 22.07.2026.
//

import Core
import Foundation

enum AuthEndpoint {
    case registerNewUser(AuthUserDTO)
    case login(AuthUserDTO)
    case refreshUser(RefreshTokenDTO)
    case logOut
    case deleteUser
}

extension AuthEndpoint: Endpoint {
    var access: Core.EndpointAccess {
        switch self {
        case .registerNewUser, .refreshUser:
                .publicEndpoint
        default:
                .authenticated
        }
    }
    
    var path: String {
        switch self {
        case .registerNewUser:
            "/api/v1/auth/register"
            
        case .login:
            "/api/v1/auth/login"
            
        case .refreshUser:
            "/api/v1/auth/refresh"
            
        case .logOut:
            "/api/v1/auth/logout"
            
        case .deleteUser:
            "/api/v1/auth"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .deleteUser: .delete
        default: .post
        }
    }
    
    var headers: HTTPHeaders {
        switch self {
        case .registerNewUser, .login, .refreshUser:
            ["Content-Type": "application/json"]
        case .logOut, .deleteUser:
            [:]
        }
    }
    
    var queryItems: [URLQueryItem] {
        []
    }
    
    var body: Data? {
        switch self {
        case let .registerNewUser(dto), let .login(dto):
            return try? JSONEncoder().encode(dto)
            
        case let .refreshUser(dto):
            return try? JSONEncoder().encode(dto)
            
        case .logOut, .deleteUser:
            return nil
        }
    }
}
