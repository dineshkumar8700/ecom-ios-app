import Foundation

protocol OAuthTokenServiceProtocol {

    func exchange(authorizationGrant: AuthorizationGrant) async throws -> OAuthTokenResponse
    
}
