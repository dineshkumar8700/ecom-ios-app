import Foundation

enum FetchProductDetailError: Error {
    case notFound
}

class FetchProductDetailUsecase: FetchProductDetailUsecaseProtocol {
    var repository: ProductRepository
    
    init(repository: ProductRepository) {
        self.repository = repository
    }
    
    func execute(id: Int) async throws -> Product {
        return try await repository.getProduct(id: id)
    }
}
