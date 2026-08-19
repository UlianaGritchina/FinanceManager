//
//  File.swift
//  AccountDomain
//
//  Created by Ульяна Гритчина on 27.07.2026.
//

import Foundation

public enum AccountStatus: Sendable {
    case active
    case unknown
    
    public init(_ status: String) {
        switch status {
        case "active":
            self = .active
        default:
            self = .unknown
        }
    }
}
