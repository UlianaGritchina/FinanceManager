//
//  File.swift
//  Profile
//
//  Created by Ульяна Гритчина on 27.07.2026.
//

import Core
import ProfileData
import ProfileDomain
import Foundation
import Swinject

final public class ProfileAssembly: Assembly {
    public init() { }
    
    public func assemble(container: Container) {
        container.register(ProfileAPI.self) { resolver in
            ProfileApiImpl(
                networkClient: resolver.resolve(NetworkClient.self)!
            )
        }
        
        container.register(ProfileRepository.self) { resolver in
            let profileAPI = resolver.resolve(ProfileAPI.self)!
            return ProfileRepositoryImpl(profileAPI: profileAPI)
        }
        
        container.register(ProfileViewModel.self) { resolver in
            let profileRepository = resolver.resolve(ProfileRepository.self)!
            return ProfileViewModel(profileRepository: profileRepository)
        }
        
        container.register(ProfileFactory.self) { resolver in
            ProfileFactoryImpl(resolver: resolver)
        }
    }
}
