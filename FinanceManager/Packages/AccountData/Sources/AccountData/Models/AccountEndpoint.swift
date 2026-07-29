//
//  File.swift
//  AccountData
//
//  Created by Ульяна Гритчина on 26.07.2026.
//

import Core
import Foundation

enum AccountEndpoint {
    case createAccount(UserDTO)
    case updateAccount(String, AccountUpdateDTO)
    case delete(String)
}

extension AccountEndpoint: Endpoint {
    var path: String {
        switch self {
        case .createAccount:
            "api/v1/account"
        case .updateAccount(let id, _):
            "api/v1/account/\(id)"
        case .delete(let id):
            "api/v1/account/\(id)"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .createAccount: .post
        case .updateAccount: .put
        case .delete: .delete
        }
    }
    
    var headers: HTTPHeaders {
        switch self {
        case .createAccount, .updateAccount:
            ["Content-Type": "application/json"]
        case .delete:
            [:]
        }
    }
    
    var queryItems: [URLQueryItem] {
        []
    }
    
    var body: Data? {
        switch self {
        case .createAccount(let userDTO):
            try? JSONEncoder().encode(userDTO)
        case .updateAccount(_, let accountUpdateDTO):
            try? JSONEncoder().encode(accountUpdateDTO)
        case .delete:
            nil
        }
    }
}
