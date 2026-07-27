//
//  ProfileAPI.swift
//  ProfileData
//
//  Created by Ульяна Гритчина on 26.07.2026.
//

import Foundation

public protocol ProfileAPI {
    func createAccount(user: UserDTO) async throws -> AccountInfoDTO
    func updateAccount(id: String, with updated: AccountUpdateDTO) async throws
    func delete(id: String) async throws
}
