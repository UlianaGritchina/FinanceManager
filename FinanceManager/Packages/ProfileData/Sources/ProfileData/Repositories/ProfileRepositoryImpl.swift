//
//  ProfileRepositoryImpl.swift
//  ProfileData
//
//  Created by Ульяна Гритчина on 27.07.2026.
//

import ProfileDomain
import Foundation

public final class ProfileRepositoryImpl: ProfileRepository {
    private let profileAPI: ProfileAPI
    
    public init(profileAPI: ProfileAPI) {
        self.profileAPI = profileAPI
    }
    
    public func createAccount(user: UserInfo) async throws -> ProfileInfo {
        let userDTO = getUserDTO(user)
        
        let accountInfoDTO = try await profileAPI.createAccount(user: userDTO)
        let profileInfo = accountInfoDTO.toDomain()
        
        return profileInfo
    }
    
    public func updateAccount(user: UserInfo) async throws {
        let accountUpdateDTO = AccountUpdateDTO(
            name: user.name,
            balance: user.balance,
            currencyId: user.currencyId
        )
        
        try await profileAPI.updateAccount(id: user.id, with: accountUpdateDTO)
    }
    
    public func delete(id: String) async throws {
        try await profileAPI.delete(id: id)
    }
    
    private func getUserDTO(_ user: UserInfo) -> UserDTO {
        UserDTO(
            id: user.id,
            name: user.name,
            balance: user.balance,
            currencyId: user.currencyId
        )
    }
}
