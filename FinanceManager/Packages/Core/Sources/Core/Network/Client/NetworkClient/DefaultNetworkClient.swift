//
//  NetworkClient.swift
//  NasaApod
//
//  Created by Ульяна Гритчина on 28.06.2026.
//

import Foundation

public final class DefaultNetworkClient: NetworkClient, Sendable {
    private let httpClient: HTTPClient
    private let requestBuilder: RequestBuilder
    private let validator: ResponseValidator
    private let decoder: ResponseDecoder
    private let interceptor: RequestInterceptor
    
    public init(
        requestBuilder: RequestBuilder,
        httpClient: HTTPClient,
        validator: ResponseValidator,
        decoder: ResponseDecoder,
        interceptor: RequestInterceptor
    ) {
        self.requestBuilder = requestBuilder
        self.httpClient = httpClient
        self.validator = validator
        self.decoder = decoder
        self.interceptor = interceptor
    }
    
    public func request<T: Decodable>(_ endpoint: Endpoint) async throws -> T {
        let request = try makeRequest(for: endpoint)
        let response = try await httpClient.execute(request: request)
        
        try validator.validate(response)
        
        return try decoder.decode(from: response.data)
    }
    
    public func request(_ endpoint: any Endpoint) async throws {
        let request = try makeRequest(for: endpoint)
        let response = try await httpClient.execute(request: request)
        
        try validator.validate(response)
    }
}

// MARK: - Private

private extension DefaultNetworkClient {
    func makeRequest(for endpoint: Endpoint) throws -> URLRequest {
        var request = try requestBuilder.build(for: endpoint)
        request = try interceptor.intercept(request, endpoint: endpoint)
        return request
    }
}
