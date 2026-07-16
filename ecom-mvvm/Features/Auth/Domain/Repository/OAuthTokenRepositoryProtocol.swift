import Foundation

protocol OAuthTokenRepositoryProtocol {

    func exchange(
        authorizationGrant: AuthorizationGrant
    ) async throws -> OAuthTokens

}
