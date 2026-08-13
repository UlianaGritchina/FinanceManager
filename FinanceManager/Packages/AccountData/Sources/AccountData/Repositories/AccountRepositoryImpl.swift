//
//  AccountRepositoryImpl.swift
//  AccountData
//
//  Created by Ульяна Гритчина on 27.07.2026.
//

import AccountDomain
import Foundation

public final class AccountRepositoryImpl: AccountRepository {
    
    private let accountAPI: AccountAPI
    
    public init(accountAPI: AccountAPI) {
        self.accountAPI = accountAPI
    }
    
    public func createAccount(user: UserInfo) async throws -> AccountInfo {
        let userDTO = getUserDTO(user)
        
        let accountInfoDTO = try await accountAPI.createAccount(user: userDTO)
        let accountInfo = accountInfoDTO.toDomain()
        
        return accountInfo
    }
    
    public func updateAccount(user: UserInfo) async throws {
        let accountUpdateDTO = AccountUpdateDTO(
            name: user.name,
            balance: user.balance,
            currencyId: user.currencyId
        )
        
        try await accountAPI.updateAccount(id: user.id, with: accountUpdateDTO)
    }
    
    public func getAccount(by id: String) async throws -> AccountInfo {
        let accountDTO = try await accountAPI.getAccount(id: id)
        return accountDTO.toDomain()
    }
    
    public func delete(id: String) async throws {
        try await accountAPI.delete(id: id)
    }
    
    private func getUserDTO(_ user: UserInfo) -> UserDTO {
        UserDTO(
            id: user.id,
            name: user.name,
            balance: user.balance,
            currencyId: user.currencyId
        )
    }
}
