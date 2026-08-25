//
//  File.swift
//  Core
//
//  Created by Ульяна Гритчина on 24.08.2026.
//

import Foundation

struct HTTPResponseValidator: ResponseValidator {
    func validate(_ response: HTTPResponse) throws {
        switch response.statusCode {
            
        case 200...299:
            return
            
        case 401:
            throw NetworkError.unauthorised
            
        case 403:
            throw NetworkError.forbidden
            
        case 404:
            throw NetworkError.notFound
            
        case 400...499:
            throw NetworkError.client(
                statusCode: response.statusCode,
                data: response.data
            )
            
        case 500...599:
            throw NetworkError.server(
                statusCode: response.statusCode,
                data: response.data
            )
            
        default:
            throw NetworkError.unexpectedStatusCode(response.statusCode)
        }
    }
}
