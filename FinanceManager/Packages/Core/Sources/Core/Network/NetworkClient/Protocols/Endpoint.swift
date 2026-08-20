//
//  Endpoint.swift
//  NasaApod
//
//  Created by Ульяна Гритчина on 28.06.2026.
//

import Foundation

public protocol Endpoint {
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: HTTPHeaders { get }
    var queryItems: [URLQueryItem] { get }
    var body: Data? { get }
    
    var access: EndpointAccess { get }
}
