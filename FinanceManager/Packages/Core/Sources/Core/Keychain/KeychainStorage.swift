//
//  KeychainStorage.swift
//  Core
//
//  Created by Ульяна Гритчина on 25.07.2026.
//

import Foundation

public protocol KeychainStorage {
    func save<T: Codable>(_ value: T, for key: KeychainKey) throws
    func get<T: Codable>(for key: KeychainKey) throws -> T
    func delete(for key: KeychainKey) throws
}
