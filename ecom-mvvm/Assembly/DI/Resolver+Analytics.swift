import Foundation
import Resolver

extension Resolver {
    static func registerAnalytics() {
        register {
            FirebaseAnalyticsService() as AnalyticsService
        }
        .scope(.application)
    }
}
