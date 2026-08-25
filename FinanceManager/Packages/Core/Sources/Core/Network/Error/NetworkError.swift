//
//  NetworkError.swift
//  NasaApod
//
//  Created by Ульяна Гритчина on 27.06.2026.
//

import Foundation

public enum NetworkError: Error, Sendable {
    case invalidURL
    case invalidRequest
    case invalidResponse
    case transport(URLError)
    case unauthorised
    case forbidden
    case notFound
    case client(statusCode: Int, data: Data)
    case server(statusCode: Int, data: Data)
    case unexpectedStatusCode(Int)
    case decoding(Error)
}
