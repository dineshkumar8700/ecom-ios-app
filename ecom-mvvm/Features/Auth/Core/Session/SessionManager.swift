import Foundation
import Combine

@MainActor
final class SessionStore: ObservableObject, SessionManagerProtocol {

    @Published private(set) var isLoggedIn = false
    @Published private(set) var currentUser: UserProfile?
    
    private let keychainStore: KeychainStoreProtocol
    
    init(keychainStore: KeychainStoreProtocol) {
        self.keychainStore = keychainStore
    }

    func saveSession(tokens: OAuthTokens, user: UserProfile) throws {
        try keychainStore.save(tokens, for: "oauth_tokens")
        currentUser = user
        isLoggedIn = true
    }

    func restoreSession() throws -> Bool {
        let tokens = try keychainStore.load(
            OAuthTokens.self,
            for: "oauth_tokens"
        )
        
        return tokens != nil
        
    }

    func logout() throws {
        try keychainStore.delete(for: "oauth_tokens")
        
        currentUser = nil
        isLoggedIn = false
    }
    
    func setUser(_ user: UserProfile) {
        currentUser = user
        isLoggedIn = true
    }
}
