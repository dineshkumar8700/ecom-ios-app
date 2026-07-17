import Foundation

protocol ProfileServiceProtocol {
    
    func getProfile(accessToken: String) async throws -> UserProfile
    
    func refreshAccessToken(refreshToken: String) async throws -> RefreshTokenResponse
    
}
