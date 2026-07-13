import Foundation
import Resolver

extension Resolver {
    static func regiserSessionStore() {
        register {
            SessionStore()
        }
        .scope(.application)
    }
}
