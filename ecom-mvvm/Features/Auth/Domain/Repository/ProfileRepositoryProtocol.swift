import Foundation

protocol ProfileRepositoryProtocol {
    func getProfile(accessToken: String) async throws -> UserProfile
}
