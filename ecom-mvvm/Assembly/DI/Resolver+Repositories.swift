import Foundation
import Resolver

extension Resolver {
    public static func registerRepositories() {
        register {
            ProductRepositoryImpl(
                service: Resolver.resolve()
            ) as ProductRepository
        }
        
        register {
            WishlistRepository(
                service: Resolver.resolve()
            ) as WishlistRepositoryProtocol
        }
    }
}
