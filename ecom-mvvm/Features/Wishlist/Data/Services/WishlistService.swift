import Foundation

class WishlistService: WishlistServiceProtocol {
    func fetchWishlist() async throws -> [Product] {
        return [
            Product(
                id: 1,
                title: "Iphone Dummy",
                price: 234.22,
                image: "heart",
                rating: Rating(rate: 4.2, count: 54)
            )
        ]
    }
    
    func saveWishlist(products: [Product]) async throws {
        print("Saving wishlist...")
    }
}
