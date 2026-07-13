import Foundation

protocol AuthenticationSessionProtocol {
    func start(
        url: URL,
        callbackScheme: String
    ) async throws -> URL
}
