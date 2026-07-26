//
//  AuthRepository.swift
//  AuthDomain
//
//  Created by Ульяна Гритчина on 21.07.2026.
//

import Foundation

public protocol AuthRepository: Sendable {
    func register(user: RegisterUserCredentials) async throws -> AuthSession
    func login(user: RegisterUserCredentials) async throws -> AuthSession
    func delete() async throws
}
