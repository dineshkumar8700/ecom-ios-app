import Foundation

class ProfileRepository: ProfileRepositoryProtocol {
    
    private let service: ProfileServiceProtocol
    
    init(service: ProfileServiceProtocol) {
        self.service = service
    }
    
    func getProfile(accessToken: String) async throws -> UserProfile {
        return try await service.getProfile(accessToken: accessToken)
    }
    
    func refreshAccessToken(refreshToken: String) async throws -> OAuthTokens {
        let response = try await service.refreshAccessToken(refreshToken: refreshToken)
        
        return OAuthTokens(
            accessToken: response.access_token,
            refreshToken: refreshToken,
            idToken: response.id_token,
            expiryDate: Date().addingTimeInterval(Double(response.expires_in)),
            tokenType: response.token_type
        )
    }
    
}
