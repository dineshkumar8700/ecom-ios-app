import Foundation
import Resolver

extension Resolver {
    static func regiserSharedState() {
        register {
            WishlistStore()
        }
        .scope(.application)
        
        register {
            SessionStore()
        }
        .scope(.application)
    }
}
