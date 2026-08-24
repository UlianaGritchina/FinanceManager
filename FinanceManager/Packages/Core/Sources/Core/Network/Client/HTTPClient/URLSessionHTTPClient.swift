//
//  File.swift
//  Core
//
//  Created by Ульяна Гритчина on 24.08.2026.
//

import Foundation

final class URLSessionHTTPClient: HTTPClient, Sendable {
    private let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func execute(request: URLRequest) async throws -> HTTPResponse {
        do {
            let (data, response) = try await session.data(for: request)
            guard let httpUrlResponse = response as? HTTPURLResponse else {
                throw NetworkError.invalidResponse
            }
            return HTTPResponse(data: data, response: httpUrlResponse)
        } catch {
            throw error
        }
    }
}
