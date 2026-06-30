import Foundation

class MockProductRepository: ProductRepository {
    func getProducts() async throws -> [Product] {
        return [
            Product(
                id: 1,
                title: "iphone",
                price: 500,
                image: "iphone.png",
                rating: Rating(rate: 4.1, count: 23)
            )
        ]
    }
    
}
