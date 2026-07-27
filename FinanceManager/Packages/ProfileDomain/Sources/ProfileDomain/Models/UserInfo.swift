//
//  File.swift
//  ProfileDomain
//
//  Created by Ульяна Гритчина on 27.07.2026.
//

import Foundation

public struct UserInfo {
    public let id: String
    public let name: String
    public let balance: Int
    public let currencyId: String
    
    public init(id: String, name: String, balance: Int, currencyId: String) {
        self.id = id
        self.name = name
        self.balance = balance
        self.currencyId = currencyId
    }
}
