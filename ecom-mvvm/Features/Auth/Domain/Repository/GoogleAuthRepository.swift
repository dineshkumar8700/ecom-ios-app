import Foundation

protocol GoogleAuthRepositoryProtocol {
    func login() async throws -> AuthorizationGrant
}

