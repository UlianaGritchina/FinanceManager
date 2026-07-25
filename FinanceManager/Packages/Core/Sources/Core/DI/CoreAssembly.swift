//
//  CoreAssembly..swift
//  FinanceManager
//
//  Created by Ульяна Гритчина on 23.07.2026.
//

import Foundation
import Swinject

public final class CoreAssembly: Assembly {
    
    public init() { }
    
    public func assemble(container: Container) {
        container.register(RequestBuilder.self) { _ in
            RequestBuilderImpl(
                baseURL: AppConfiguration.baseURL
            )
        }
        .inObjectScope(.container)
        
        container.register(NetworkClient.self) { resolver in
            NetworkClientImpl(
                baseURL: AppConfiguration.baseURL,
                requestBuilder: resolver.resolve(RequestBuilder.self)!
            )
        }
        .inObjectScope(.container)
        
        container.register(KeychainStorage.self) { _ in
            KeychainStorageImpl(service: AppConfiguration.keychainService)
        }
        .inObjectScope(.container)
    }
}
