//
//  NetworkClient.swift
//  NasaApod
//
//  Created by Ульяна Гритчина on 28.06.2026.
//

import Foundation

public final class NetworkClientImpl: NetworkClient, Sendable {
    private let baseURL: URL
    private let session: URLSession
    private let requestBuilder: RequestBuilder
    
    public init(baseURL: URL, session: URLSession = .shared, requestBuilder: RequestBuilder) {
        self.baseURL = baseURL
        self.session = session
        self.requestBuilder = requestBuilder
    }
    
    public func request<T: Decodable>(_ endpoint: Endpoint) async throws -> T {
        let request = try requestBuilder.build(for: endpoint)
        let (data, response) = try await session.data(for: request)
        
        try validate(response)
        
        return try JSONDecoder().decode(T.self, from: data)
    }
    
    public func request(_ endpoint: Endpoint) async throws {
        let request = try requestBuilder.build(for: endpoint)
        
        let (_, response) = try await session.data(for: request)
        
        try validate(response)
    }
}

// MARK: - Private

private extension NetworkClientImpl {
    func validate(_ response: URLResponse) throws {
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }
        
        guard 200...299 ~= httpResponse.statusCode else {
            throw NetworkError.serverError(httpResponse.statusCode)
        }
    }
}
