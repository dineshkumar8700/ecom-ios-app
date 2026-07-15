import Foundation

protocol SessionManagerProtocol {
    var isLoggedIn: Bool { get }
    var currentUser: UserProfile? { get }
    
    func saveSession(
        tokens: OAuthTokens,
        user: UserProfile
    ) throws
    
    func restoreSession() throws -> Bool
    
    func logout() throws
    
}
