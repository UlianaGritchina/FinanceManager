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
    func getAccount(by id: String) async throws -> AccountInfo
    func delete(id: String) async throws
}
