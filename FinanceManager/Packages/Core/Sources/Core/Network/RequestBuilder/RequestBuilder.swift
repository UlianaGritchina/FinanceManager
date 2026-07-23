//
//  RequestBuilder.swift
//  Core
//
//  Created by Ульяна Гритчина on 22.07.2026.
//

import Foundation

public protocol RequestBuilder: Sendable {
    func build(for endpoint: Endpoint) throws -> URLRequest
}
