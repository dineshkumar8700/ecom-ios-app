import Foundation

final class ExchangeAuthorizationCodeUseCase {

    private let repository: OAuthTokenRepositoryProtocol

    init(repository: OAuthTokenRepositoryProtocol) {
        self.repository = repository
    }

    func execute(authorizationGrant: AuthorizationGrant) async throws -> OAuthToken {

        try await repository.exchange(
            authorizationGrant: authorizationGrant
        )

    }

}
