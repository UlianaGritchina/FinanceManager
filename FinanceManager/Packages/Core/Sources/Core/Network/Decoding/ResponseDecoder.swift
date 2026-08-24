//
//  ResponseDecoder.swift
//  Core
//
//  Created by Ульяна Гритчина on 24.08.2026.
//

import Foundation

public protocol ResponseDecoder: Sendable {
    func decode<T: Decodable>(from data: Data) throws -> T
}
