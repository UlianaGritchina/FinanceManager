//
//  AccessTokenProviderImpl.swift
//  Core
//
//  Created by Ульяна Гритчина on 19.08.2026.
//

import Foundation

final class AccessTokenProviderImpl: AccessTokenProvider {
    let tokenStore: TokenStore
    
    init(tokenStore: TokenStore) {
        self.tokenStore = tokenStore
    }
    
    func getAccessToken() throws -> String {
        try tokenStore.getAccessToken()
    }
}
