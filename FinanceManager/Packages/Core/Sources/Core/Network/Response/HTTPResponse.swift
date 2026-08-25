//
//  HTTPResponse.swift
//  Core
//
//  Created by Ульяна Гритчина on 24.08.2026.
//

import Foundation

public struct HTTPResponse: Sendable {
    public let data: Data
    public let response: HTTPURLResponse

    public init(data: Data, response: HTTPURLResponse) {
        self.data = data
        self.response = response
    }

    public var statusCode: Int {
        response.statusCode
    }

    public var headers: [AnyHashable: Any] {
        response.allHeaderFields
    }
}
