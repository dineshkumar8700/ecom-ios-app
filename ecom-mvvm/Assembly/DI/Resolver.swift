import Foundation
import Resolver

extension Resolver: ResolverRegistering {
    
    public static func registerAllServices() {
        registerAnalytics()
        registerNetwork()
        registerServices()
        registerRepositories()
        regiserSharedState()
        registerUseCases()
    }
}
