//
//  File.swift
//  ProfileData
//
//  Created by Ульяна Гритчина on 26.07.2026.
//

import Foundation

public struct UserAccountDTO: Decodable {
    let id: String
    let createdAt: String
    let updatedAt: String
    let userId: String
    let name: String
    let balance: Int
    let currencyId: String
    let status: String
}
