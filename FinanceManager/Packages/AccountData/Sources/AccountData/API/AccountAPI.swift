//
//  AccountAPI.swift
//  AccountData
//
//  Created by Ульяна Гритчина on 26.07.2026.
//

import Foundation

public protocol AccountAPI: Sendable {
    func createAccount(user: UserDTO) async throws -> AccountInfoDTO
    func updateAccount(id: String, with updated: AccountUpdateDTO) async throws
    func getAccount(id: String) async throws -> AccountInfoDTO
    func delete(id: String) async throws
}
