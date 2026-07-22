//
//  RequestBuilderImpl.swift
//  Core
//
//  Created by Ульяна Гритчина on 22.07.2026.
//

import Foundation

final class RequestBuilderImpl: RequestBuilder {
    private let baseURL: URL
    
    init(baseURL: URL) {
        self.baseURL = baseURL
    }
    
    public func build(for endpoint: any Endpoint) throws -> URLRequest {
        var components = URLComponents(
            url: baseURL.appendingPathComponent(endpoint.path),
            resolvingAgainstBaseURL: false
        )
        
        components?.queryItems = endpoint.queryItems
        
        guard let url = components?.url else {
            throw NetworkError.invalidURL
        }
        
        var request = URLRequest(url: url)
        
        request.httpMethod = endpoint.method.rawValue
        
        endpoint.headers.forEach {
            request.setValue($1, forHTTPHeaderField: $0)
        }
        
        request.httpBody = endpoint.body
        
        return request
    }
}
