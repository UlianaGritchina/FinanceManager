//
//  File.swift
//  AccountDomain
//
//  Created by Ульяна Гритчина on 27.07.2026.
//

import Foundation

public struct Account {
    public let id: String
    public let createdAt: Date
    public let updatedAt: Date
    public let userId: String
    public let userName: String
    public let balance: Int
    public let currencyId: String
    public let status: AccountStatus
    
    public init(
        id: String,
        createdAt: Date,
        updatedAt: Date,
        userId: String,
        userName: String,
        balance: Int,
        currencyId: String,
        status: AccountStatus
    ) {
        self.id = id
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.userId = userId
        self.userName = userName
        self.balance = balance
        self.currencyId = currencyId
        self.status = status
    }
}
