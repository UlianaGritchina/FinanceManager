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
    private let interceptor: RequestInterceptor
    
    public init(
        baseURL: URL,
        session: URLSession = .shared,
        requestBuilder: RequestBuilder,
        interceptor: RequestInterceptor
    ) {
        self.baseURL = baseURL
        self.session = session
        self.requestBuilder = requestBuilder
        self.interceptor = interceptor
    }
    
    public func request<T: Decodable>(_ endpoint: Endpoint) async throws -> T {
        let request = try makeRequest(for: endpoint)
        let (data, response) = try await session.data(for: request)
        try validate(response)
        
        return try JSONDecoder().decode(T.self, from: data)
    }
    
    public func request(_ endpoint: Endpoint) async throws {
        let request = try makeRequest(for: endpoint)
        
        let (_, response) = try await session.data(for: request)
        
        try validate(response)
    }
}

// MARK: - Private

private extension NetworkClientImpl {
    func makeRequest(for endpoint: Endpoint) throws -> URLRequest {
        var request = try requestBuilder.build(for: endpoint)
        request = try interceptor.intercept(request, endpoint: endpoint)
        return request
    }
    
    func validate(_ response: URLResponse) throws {
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }
        let statusCode = httpResponse.statusCode
        
        switch statusCode {
        case 200...299:
            return
            
        case 401:
            throw NetworkError.unauthorised
            
        case 403:
            throw NetworkError.forbidden
            
        case 404:
            throw NetworkError.notFound
            
        default:
            throw NetworkError.serverError(statusCode: statusCode, message: "")
        }
    }
}
