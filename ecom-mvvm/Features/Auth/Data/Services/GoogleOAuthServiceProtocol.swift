import Foundation

protocol GoogleOAuthServiceProtocol {
    func login() async throws -> AuthorizationGrant
}
