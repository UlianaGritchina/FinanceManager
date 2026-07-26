//
//  KeychainStorageImpl.swift
//  Core
//
//  Created by Ульяна Гритчина on 25.07.2026.
//

import Foundation
import Security

public final class KeychainStorageImpl: KeychainStorage {
    private let service: String
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()

    public init(service: String) {
        self.service = service
    }

    public func save<T: Codable>(_ value: T, for key: KeychainKey) throws {
        let data = try encoder.encode(value)
        try save(data, for: key)
    }

    public func get<T: Codable>(for key: KeychainKey) throws -> T {
        guard let data = try load(for: key) else {
            throw KeychainError.itemNotFound
        }

        guard let value = try? decoder.decode(T.self, from: data) else {
            throw KeychainError.unexpectedData
        }
        
        return value
    }

    public func delete(for key: KeychainKey) throws {
        let query = makeQuery(for: key)

        let status = SecItemDelete(query as CFDictionary)

        guard status == errSecSuccess || status == errSecItemNotFound else {
            throw KeychainError.unhandledError(status)
        }
    }
}

// MARK: - Private

private extension KeychainStorageImpl {

    func save(_ data: Data, for key: KeychainKey) throws {
        let query = makeQuery(for: key)

        let updateStatus = SecItemUpdate(
            query as CFDictionary,
            [kSecValueData: data] as CFDictionary
        )

        switch updateStatus {
        case errSecSuccess:
            return

        case errSecItemNotFound:
            var addQuery = query
            addQuery[kSecValueData] = data
            addQuery[kSecAttrAccessible] = kSecAttrAccessibleAfterFirstUnlock

            let addStatus = SecItemAdd(addQuery as CFDictionary, nil)

            guard addStatus == errSecSuccess else {
                throw KeychainError.unhandledError(addStatus)
            }

        default:
            throw KeychainError.unhandledError(updateStatus)
        }
    }

    func load(for key: KeychainKey) throws -> Data? {
        var query = makeQuery(for: key)
        query[kSecReturnData] = true
        query[kSecMatchLimit] = kSecMatchLimitOne

        var result: AnyObject?

        let status = SecItemCopyMatching(
            query as CFDictionary,
            &result
        )

        switch status {
        case errSecSuccess:
            guard let data = result as? Data else {
                throw KeychainError.unexpectedData
            }
            return data

        case errSecItemNotFound:
            return nil

        default:
            throw KeychainError.unhandledError(status)
        }
    }

    func makeQuery(for key: KeychainKey) -> [CFString: Any] {
        [
            kSecClass: kSecClassGenericPassword,
            kSecAttrService: service,
            kSecAttrAccount: key.rawValue
        ]
    }
}
