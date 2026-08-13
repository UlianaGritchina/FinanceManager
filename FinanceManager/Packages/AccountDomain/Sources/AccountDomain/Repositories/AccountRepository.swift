//
//  File.swift
//  AccountDomain
//
//  Created by Ульяна Гритчина on 27.07.2026.
//

import Foundation

public protocol AccountRepository {
    func createAccount(user: UserInfo) async throws -> Account
    func updateAccount(user: UserInfo) async throws
    func getAccount(by id: String) async throws -> Account
    func delete(id: String) async throws
}
