//
//  File.swift
//  Core
//
//  Created by Ульяна Гритчина on 20.08.2026.
//

import Foundation

public final class AuthInterceptor: RequestInterceptor {
    private let tokenProvider: AccessTokenProvider
    
    public init(tokenProvider: AccessTokenProvider) {
        self.tokenProvider = tokenProvider
    }
    
    public func intercept(_ request: URLRequest, endpoint: any Endpoint) throws -> URLRequest {
        guard endpoint.access == .authenticated else { return request }
        
        let token = try tokenProvider.getAccessToken()
        var request = request
        
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        return request
    }
}
