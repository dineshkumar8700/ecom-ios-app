import Foundation
import Combine

@MainActor
final class SessionStore: ObservableObject {
    @Published private(set) var isLoggedIn = false

    func login() {
        isLoggedIn = true
    }

    func logout() {
        isLoggedIn = false
    }
}
