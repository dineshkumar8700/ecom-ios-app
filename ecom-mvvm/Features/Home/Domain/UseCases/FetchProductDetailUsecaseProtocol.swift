import Foundation

protocol FetchProductDetailUsecaseProtocol {
    func execute(id: Int) async throws -> Product
}
