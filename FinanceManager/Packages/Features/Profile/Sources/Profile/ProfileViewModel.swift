//
//  ProfileViewModel.swift
//  Profile
//
//  Created by Ульяна Гритчина on 26.07.2026.
//

import Foundation
import ProfileDomain

@Observable
final class ProfileViewModel {
    private let profileRepository: ProfileRepository
    
    let userInfo = UserInfo(
        id: UUID().uuidString.lowercased(),
        name: "F",
        balance: 0,
        currencyId: "3fa85f64-5717-4562-b3fc-2c963f66afa6"
    )
    
    var profileInfo: ProfileInfo?
    
    init(profileRepository: ProfileRepository) {
        self.profileRepository = profileRepository
    }
    
    @MainActor
    func crateAccountButtonPressed() {
        Task {
            do {
                try await createAccount()
            } catch {
                print(error)
            }
        }
    }
    
    private func createAccount() async throws {
        print("--")
        print(userInfo.id)
        profileInfo = try await profileRepository.createAccount(user: userInfo)
    }
}
