import Foundation
@testable import ecom_mvvm

class MockProductRepository: ProductRepository {
    
    var result: Result<[Product], Error> = .success([])
    
    func getProducts() async throws -> [Product] {
        return try result.get()
    }
    
}
