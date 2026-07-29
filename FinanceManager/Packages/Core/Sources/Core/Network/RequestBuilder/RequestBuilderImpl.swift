//
//  RequestBuilderImpl.swift
//  Core
//
//  Created by Ульяна Гритчина on 22.07.2026.
//

import Foundation

public final class RequestBuilderImpl: RequestBuilder {
    private let baseURL: URL
    private let keychainStorage: KeychainStorage
    
    public init(baseURL: URL, keychainStorage: KeychainStorage) {
        self.baseURL = baseURL
        self.keychainStorage = keychainStorage
    }
    
    public func build(for endpoint: any Endpoint) throws -> URLRequest {
        var components = URLComponents(
            url: baseURL.appendingPathComponent(endpoint.path),
            resolvingAgainstBaseURL: false
        )
        
        if !endpoint.queryItems.isEmpty {
            components?.queryItems = endpoint.queryItems
        }
        
        guard let url = components?.url else {
            throw NetworkError.invalidURL
        }
        
        var request = URLRequest(url: url)
        
        if let token: String = try? keychainStorage.get(for: .accessToken) {
            request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        }
        
        request.httpMethod = endpoint.method.rawValue
        
        endpoint.headers.forEach {
            request.setValue($1, forHTTPHeaderField: $0)
        }
        
        request.httpBody = endpoint.body
        
        return request
    }
}
