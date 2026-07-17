import Foundation

class ProfileService: ProfileServiceProtocol {
    
    private let network: NetworkClient
    
    init(network: NetworkClient) {
        self.network = network
    }
    
    func getProfile(accessToken: String) async throws -> UserProfile {
        
        var request = URLRequest(url: URL(string: "https://www.googleapis.com/oauth2/v3/userinfo")!)
        request.setValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
        
        return try await network.request(request)
    }
    
    func refreshAccessToken(refreshToken: String) async throws -> RefreshTokenResponse {
        var request = URLRequest(url: URL(string: "https://oauth2.googleapis.com/token")!)
        request.httpMethod = "POST"
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")

        let body =
        """
        client_id=\(String(describing: GoogleOAuthConfiguration.clientID))&
        grant_type=refresh_token&
        refresh_token=\(refreshToken)
        """

        request.httpBody = body
            .replacingOccurrences(of: "\n", with: "")
            .data(using: .utf8)
        
        return try await network.request(request)
    }
}
