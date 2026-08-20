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
        container.register(RequestBuilder.self) { resolver in
            RequestBuilderImpl(baseURL: AppConfiguration.baseURL)
        }
        .inObjectScope(.container)
        
        container.register(TokenStore.self) { resolver in
            KeychainTokenStore(keychainStorage: resolver.resolve(KeychainStorage.self)!)
        }
        
        container.register(AccessTokenProvider.self) { resolver in
            AccessTokenProviderImpl(tokenStore: resolver.resolve(TokenStore.self)!)
        }
        
        container.register(RequestInterceptor.self) { resolver in
            AuthInterceptor(tokenProvider: resolver.resolve(AccessTokenProvider.self)!)
        }
        
        container.register(NetworkClient.self) { resolver in
            NetworkClientImpl(
                baseURL: AppConfiguration.baseURL,
                requestBuilder: resolver.resolve(RequestBuilder.self)!,
                interceptor: resolver.resolve(RequestInterceptor.self)!
            )
        }
        .inObjectScope(.container)
        
        container.register(KeychainStorage.self) { _ in
            KeychainStorageImpl(service: AppConfiguration.keychainService)
        }
        .inObjectScope(.container)
    }
}
