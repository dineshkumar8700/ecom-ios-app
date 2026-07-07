import Foundation

protocol FetchProductUseCaseProtocol {
    func execute() async throws -> [Product]
}
