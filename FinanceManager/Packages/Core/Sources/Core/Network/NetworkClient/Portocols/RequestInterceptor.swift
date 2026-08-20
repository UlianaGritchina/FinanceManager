//
//  File.swift
//  Core
//
//  Created by Ульяна Гритчина on 20.08.2026.
//

import Foundation

public protocol RequestInterceptor: Sendable {
    func intercept(_ request: URLRequest, endpoint: Endpoint) throws -> URLRequest
}
