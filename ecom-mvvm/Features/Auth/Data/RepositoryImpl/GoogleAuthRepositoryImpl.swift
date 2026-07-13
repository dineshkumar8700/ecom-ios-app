import Foundation

final class GoogleAuthRepository: GoogleAuthRepositoryProtocol {

    private let service: GoogleOAuthServiceProtocol

    init(service: GoogleOAuthServiceProtocol) {
        self.service = service
    }

    func login() {
        service.login()
    }
}
