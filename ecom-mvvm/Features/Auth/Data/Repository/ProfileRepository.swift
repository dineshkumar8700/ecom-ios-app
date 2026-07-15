import Foundation

class ProfileRepository: ProfileRepositoryProtocol {
    
    private let service: ProfileServiceProtocol
    
    init(service: ProfileServiceProtocol) {
        self.service = service
    }
    
    func getProfile(accessToken: String) async throws -> UserProfile {
        return try await service.getProfile(accessToken: accessToken)
    }
    
}
