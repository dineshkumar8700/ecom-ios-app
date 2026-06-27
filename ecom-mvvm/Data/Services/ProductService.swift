import Foundation

enum ProductServiceError: Error {
    case invalidURL
}

class ProductService {
    private let network: NetworkClient
    
    init(network: NetworkClient) {
        self.network = network
    }
    
    func fetchProducts() async throws -> [Product] {
        
        guard let url = URL(string: "https://fakestoreapi.com/products") else {
            throw ProductServiceError.invalidURL
        }
        
        let request = URLRequest(url: url)
        
        return try await network.request(request)
    }
}
