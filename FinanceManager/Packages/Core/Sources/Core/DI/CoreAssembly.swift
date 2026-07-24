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
                baseURL: URL(string: "http://yourflow.pro")!
            )
        }
        .inObjectScope(.container)
        
        container.register(NetworkClient.self) { _ in
            NetworkClientImpl(
                baseURL: URL(string: "http://yourflow.pro")!,
                requestBuilder: container.resolve(RequestBuilder.self)!
            )
        }
        .inObjectScope(.container)
    }
}
