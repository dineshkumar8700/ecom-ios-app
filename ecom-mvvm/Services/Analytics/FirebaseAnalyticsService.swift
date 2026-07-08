import Foundation
import FirebaseAnalytics

final class FirebaseAnalyticsService: AnalyticsService {
    func logEvent(name: String, parameters: [String: Any]?) {
        Analytics.logEvent(name, parameters: parameters)
    }
}
