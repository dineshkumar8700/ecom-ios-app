import Foundation

class AuthorizedNetworkClient {
    let sessionManager: SessionManager
    let getProfileUseCase: GetProfileUseCase
    let refreshTokenUseCase: RefreshTokenUseCase
    
    init(
        sessionManager: SessionManager,
        getProfileUseCase: GetProfileUseCase,
        refreshTokenuseCase: RefreshTokenUseCase
    ) {
        self.sessionManager = sessionManager
        self.refreshTokenUseCase = refreshTokenuseCase
        self.getProfileUseCase = getProfileUseCase
    }
    
    func loadUserProfile() async throws -> UserProfile {
        do {
            return try await getProfileUseCase.execute(accessToken: try sessionManager.getAccessToken())
            
        } catch APIError.serverError(401) {
            try await refreshTokenUseCase
                .execute(refreshToken: try sessionManager.getRefreshToken())
            return try await getProfileUseCase.execute(accessToken: try sessionManager.getAccessToken())
        }
    }
}
