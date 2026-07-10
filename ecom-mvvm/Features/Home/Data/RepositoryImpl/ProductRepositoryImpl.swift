import Foundation

class ProductRepositoryImpl: ProductRepository{
    private let service: ProductService
    
    init(service: ProductService) {
        self.service = service
    }
    
    func getProducts() async throws -> [Product] {
        return try await service.fetchProducts()
    }
    
    func getProduct(id: Int) async throws -> Product {
        let products = try await service.fetchProducts()
        return products.first(where: {$0.id == id})!
    }
    
}
