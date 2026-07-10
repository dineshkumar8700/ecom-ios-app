import Foundation

protocol ProductRepository {
    func getProducts() async throws -> [Product]
    
    func getProduct(id: Int) async throws -> Product
}
