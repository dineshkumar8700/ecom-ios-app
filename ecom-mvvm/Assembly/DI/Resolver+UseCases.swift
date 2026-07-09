import Foundation
import Resolver

extension Resolver {
    static func registerUseCases() {
        register {
            FetchWishlistUseCase(
                repository: Resolver.resolve(),
                store: Resolver.resolve()
            )
        }
        .scope(.application)
        
        register {
            ToggleWishlistUseCase(
                repository: Resolver.resolve(),
                store: Resolver.resolve()
            )
        }
        .scope(.application)
        
        register {
            FetchProductUseCase(repository: Resolver.resolve()) as FetchProductUseCaseProtocol
        }
        .scope(.application)
        
    }
}
