//
//  JSONResponseDecoder.swift
//  Core
//
//  Created by Ульяна Гритчина on 24.08.2026.
//

import Foundation

struct JSONResponseDecoder: ResponseDecoder {
    private let decoder: JSONDecoder
    
    init(decoder: JSONDecoder = .init()) {
        self.decoder = decoder
    }
    
    func decode<T>(from data: Data) throws -> T where T : Decodable {
        do {
            return try decoder.decode(T.self, from: data)
        } catch {
            throw NetworkError.decoding(error)
        }
    }
}
