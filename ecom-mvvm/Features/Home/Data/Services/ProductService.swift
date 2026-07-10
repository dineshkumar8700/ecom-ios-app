import Foundation

protocol ProductService {
    func fetchProducts() async throws -> [Product]
}
