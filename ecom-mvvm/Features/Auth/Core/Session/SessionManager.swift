import Foundation
import Combine

enum AuthError: Error {
    case noAccessToken
    case noRefreshToken
}

@MainActor
final class SessionManager: ObservableObject, SessionManagerProtocol {

    @Published private(set) var isLoggedIn = false
    @Published private(set) var currentUser: UserProfile?
    
    private let keychainStore: KeychainStoreProtocol
    
    init(keychainStore: KeychainStoreProtocol) {
        self.keychainStore = keychainStore
    }

    func saveSession(tokens: OAuthTokens, user: UserProfile) throws {
        try keychainStore.save(tokens, for: KeychainKey.oAuthTokens)
        self.setUser(user)
    }

    func restoreSession() throws -> Bool {
        let tokens = try keychainStore.load(
            OAuthTokens.self,
            for: KeychainKey.oAuthTokens
        )
        
        return tokens != nil
        
    }

    func logout() throws {
        try keychainStore.delete(for: KeychainKey.oAuthTokens)
        
        currentUser = nil
        isLoggedIn = false
    }
    
    func setUser(_ user: UserProfile) {
        currentUser = user
        isLoggedIn = true
    }
    
    
    func getAccessToken() throws -> String {
        if let tokens = try keychainStore.load(OAuthTokens.self, for: KeychainKey.oAuthTokens) {
            return tokens.accessToken
        }
        
        throw AuthError.noAccessToken
    }
    
    func getRefreshToken() throws -> String {
        if let tokens = try keychainStore.load(OAuthTokens.self, for: KeychainKey.oAuthTokens) {
            return tokens.refreshToken
        }
        
        throw AuthError.noRefreshToken
    }
    
}
