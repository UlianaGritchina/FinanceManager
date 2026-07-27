//
//  AccountInfoDTO.swift
//  ProfileData
//
//  Created by Ульяна Гритчина on 26.07.2026.
//

import ProfileDomain
import Foundation

public struct AccountInfoDTO: Decodable {
    let id: String
    let createdAt: String
    let updatedAt: String
    let userId: String
    let name: String
    let balance: Int
    let currencyId: String
    let status: String
}

extension AccountInfoDTO {
    func toDomain() -> ProfileInfo {
        let iso8601Formatter = ISO8601DateFormatter()

        return ProfileInfo(
            id: id,
            createdAt: iso8601Formatter.date(from: createdAt) ?? .distantPast,
            updatedAt: iso8601Formatter.date(from: updatedAt) ?? .distantPast,
            userId: userId,
            userName: name,
            balance: balance,
            currencyId: currencyId,
            status: statusToDomain(status)
        )
    }
    
    private func statusToDomain(_ status: String) -> ProfileStatus {
        switch status.lowercased() {
        case "active":
            return .active
        default:
            return .unknown
        }
    }
}
