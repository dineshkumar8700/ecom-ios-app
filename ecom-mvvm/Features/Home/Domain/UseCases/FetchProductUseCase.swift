import Foundation

struct FetchProductUseCase: FetchProductUseCaseProtocol {
    private let repository: ProductRepository
    
    init(repository: ProductRepository) {
        self.repository = repository
    }
    
    func execute() async throws -> [Product] {
        return try await repository.getProducts()
    }
}
