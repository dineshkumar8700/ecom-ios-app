import Foundation
import Resolver

extension Resolver {
    public static func registerServices() {
        register {
            ProductServiceImpl(network: Resolver.resolve()) as ProductService
        }
        .scope(.application)
        
        register {
            WishlistService() as WishlistServiceProtocol
        }
        .scope(.application)
        
        register {
            GoogleOAuthService(
                authenticationSession: resolve()
            ) as GoogleOAuthServiceProtocol
        }
        
        register {
            AuthenticationSession() as AuthenticationSessionProtocol
        }
        .scope(.application)
        
        register {
            OAuthTokenService(networkClient: resolve()) as OAuthTokenServiceProtocol
        }
        .scope(.application)
        
        
    }
}
