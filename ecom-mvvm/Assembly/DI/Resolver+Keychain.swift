import Foundation
import Resolver

extension Resolver {
    
    public static func registerKeychain() {
        register {
            KeychainStore() as KeychainStoreProtocol
        }
        .scope(.application)
        
    }
}
