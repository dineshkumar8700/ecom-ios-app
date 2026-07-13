import Foundation
import Resolver

extension Resolver {
    public static func registerRepositories() {
        register {
            ProductRepositoryImpl(
                service: resolve()
            ) as ProductRepository
        }
        
        register {
            WishlistRepository(
                service: resolve()
            ) as WishlistRepositoryProtocol
        }
        
        register {
            GoogleAuthRepository(
                service: resolve()
            ) as GoogleAuthRepositoryProtocol
        }
        
        register {
            OAuthTokenRepository(
                service: resolve()
            ) as OAuthTokenRepositoryProtocol
        }
        .scope(.application)
    }
}
