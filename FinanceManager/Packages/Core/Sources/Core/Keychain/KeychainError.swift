//
//  KeychainError.swift
//  Core
//
//  Created by Ульяна Гритчина on 25.07.2026.
//

import Foundation

public enum KeychainError: LocalizedError {
    case itemNotFound
    case unexpectedData
    case unhandledError(OSStatus)

    public var errorDescription: String? {
        switch self {
        case .itemNotFound:
            return "Item not found."
        case .unexpectedData:
            return "Unexpected data."
        case .unhandledError(let status):
            return "Keychain error: \(status)"
        }
    }
}
