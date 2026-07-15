import Foundation

protocol ProfileServiceProtocol {
    
    func getProfile(accessToken: String) async throws -> UserProfile
    
}
