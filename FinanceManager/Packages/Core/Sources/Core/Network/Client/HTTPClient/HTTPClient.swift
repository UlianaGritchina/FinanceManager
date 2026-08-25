//
//  File.swift
//  Core
//
//  Created by Ульяна Гритчина on 24.08.2026.
//

import Foundation

public protocol HTTPClient: Sendable {
    func execute(request: URLRequest) async throws -> HTTPResponse
}
