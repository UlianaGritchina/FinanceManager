//
//  File.swift
//  ProfileData
//
//  Created by Ульяна Гритчина on 26.07.2026.
//

import Foundation

public struct UserDTO: Encodable {
    let id: String
    let name: String
    let balance: Int
    let currencyId: String
}
