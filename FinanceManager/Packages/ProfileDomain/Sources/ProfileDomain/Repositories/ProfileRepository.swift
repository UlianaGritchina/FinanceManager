//
//  File.swift
//  ProfileDomain
//
//  Created by Ульяна Гритчина on 27.07.2026.
//

import Foundation

public protocol ProfileRepository {
    func createAccount(user: UserInfo) async throws -> ProfileInfo
    func updateAccount(user: UserInfo) async throws
    func delete(id: String) async throws
}
