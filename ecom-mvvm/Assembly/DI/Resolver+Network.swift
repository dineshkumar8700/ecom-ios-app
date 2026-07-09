import Foundation
import Resolver

extension Resolver {
    public static func registerNetwork() {
        register {
            URLSessionNetworkClient() as NetworkClient
        }
        .scope(.application)
    }
}
