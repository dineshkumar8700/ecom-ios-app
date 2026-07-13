import Foundation

final class OAuthTokenRepository: OAuthTokenRepositoryProtocol {

    private let service: OAuthTokenServiceProtocol

    init(service: OAuthTokenServiceProtocol) {
        self.service = service
    }

    func exchange(authorizationGrant: AuthorizationGrant) async throws -> OAuthToken {

        let response = try await service.exchange(
            authorizationGrant: authorizationGrant
        )

        return OAuthTokenMapper.toDomain(response)

    }

}
