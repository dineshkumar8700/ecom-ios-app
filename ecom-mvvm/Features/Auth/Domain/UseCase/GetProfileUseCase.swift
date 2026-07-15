import Foundation

class GetProfileUseCase {
    
    private let repository: ProfileRepositoryProtocol
    
    init(repository: ProfileRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute(accessToken: String) async throws -> UserProfile {
        return try await repository.getProfile(accessToken: accessToken)
    }
}
