import Foundation

final class LoginWithGoogleUseCase {

    private let repository: GoogleAuthRepositoryProtocol

    init(repository: GoogleAuthRepositoryProtocol) {
        self.repository = repository
    }

    func execute() async throws -> AuthorizationGrant {
        return try await repository.login()
    }
}
