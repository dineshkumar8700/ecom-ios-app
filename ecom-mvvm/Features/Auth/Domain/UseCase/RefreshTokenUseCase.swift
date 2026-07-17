import Foundation

class RefreshTokenUseCase {
    
    let client: NetworkClient
    let repository: ProfileRepositoryProtocol
    
    init(client: NetworkClient, repository: ProfileRepositoryProtocol) {
        self.client = client
        self.repository = repository
    }
    
    func execute(refreshToken: String) async throws -> OAuthTokens {
        return try await self.repository.refreshAccessToken(refreshToken: refreshToken)
    
    }
}
