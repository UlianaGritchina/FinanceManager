//
//  AccountApiImpl.swift
//  AccountData
//
//  Created by Ульяна Гритчина on 27.07.2026.
//

import Core
import Foundation

public final class AccountApiImpl: AccountAPI {
    private let networkClient: NetworkClient
    
    public init(networkClient: NetworkClient) {
        self.networkClient = networkClient
    }
    
    public func createAccount(user: UserDTO) async throws -> AccountInfoDTO {
        let endpoint = AccountEndpoint.createAccount(user)
        return try await networkClient.request(endpoint)
    }
    
    public func updateAccount(id: String, with updated: AccountUpdateDTO) async throws {
        let endpoint = AccountEndpoint.updateAccount(id, updated)
        try await networkClient.request(endpoint)
    }
    
    public func getAccount(id: String) async throws -> AccountInfoDTO {
        try await networkClient.request(AccountEndpoint.getAccount(id))
    }
    
    public func delete(id: String) async throws {
        try await networkClient.request(AccountEndpoint.delete(id))
    }
}
