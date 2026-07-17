import Foundation

protocol ProfileRepositoryProtocol {
    func getProfile(accessToken: String) async throws -> UserProfile
    
    func refreshAccessToken(refreshToken: String) async throws -> OAuthTokens
}
