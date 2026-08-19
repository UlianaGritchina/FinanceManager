//
//  File.swift
//  Core
//
//  Created by Ульяна Гритчина on 19.08.2026.
//

import Foundation

public protocol TokenStore: Sendable  {
    func getAccessToken() throws -> String
    func getRefreshToken() throws -> String
    func save(accessToken: String, refreshToken: String) throws
    func clear() throws
}

public final class KeychainTokenStore: TokenStore {
    private let keychainStorage: KeychainStorage
    
    init(keychainStorage: KeychainStorage) {
        self.keychainStorage = keychainStorage
    }
    
    public func getAccessToken() throws -> String {
        try keychainStorage.get(for: .accessToken)
    }
    
    public func getRefreshToken() throws -> String {
        try keychainStorage.get(for: .refreshToken)
    }
    
    public func save(accessToken: String, refreshToken: String) throws {
        try keychainStorage.save(accessToken, for: .accessToken)
        try keychainStorage.save(refreshToken, for: .refreshToken)
    }
    
    public func clear() throws {
        try keychainStorage.delete(for: .accessToken)
        try keychainStorage.delete(for: .refreshToken)
    }
}
