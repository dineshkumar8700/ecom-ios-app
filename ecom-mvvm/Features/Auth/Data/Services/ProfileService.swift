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
}
