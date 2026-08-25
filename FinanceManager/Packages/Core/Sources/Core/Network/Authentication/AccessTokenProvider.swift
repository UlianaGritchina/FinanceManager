//
//  AccessTokenProvider.swift
//  Core
//
//  Created by Ульяна Гритчина on 19.08.2026.
//

import Foundation

public protocol AccessTokenProvider: Sendable {
    func getAccessToken() throws -> String
}
