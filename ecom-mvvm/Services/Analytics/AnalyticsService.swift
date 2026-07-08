import Foundation

protocol AnalyticsService {
    func logEvent(name: String, parameters: [String: Any]?)
}
