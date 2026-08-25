//
//  ResponseValidator.swift
//  Core
//
//  Created by Ульяна Гритчина on 24.08.2026.
//

import Foundation

public protocol ResponseValidator: Sendable {
    func validate(_ response: HTTPResponse) throws
}
