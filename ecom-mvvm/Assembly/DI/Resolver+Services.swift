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
    }
}
