//
//  File.swift
//  AccountDomain
//
//  Created by Ульяна Гритчина on 27.07.2026.
//

import Foundation

public protocol AccountRepository {
    func createAccount(user: UserInfo) async throws -> AccountInfo
    func updateAccount(user: UserInfo) async throws
    func delete(id: String) async throws
}
