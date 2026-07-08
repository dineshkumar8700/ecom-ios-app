import Foundation

final class WishlistService: WishlistServiceProtocol {

    private var wishlist: [Product] = []

    func fetchWishlist() async throws -> [Product] {
        wishlist
    }

    func saveWishlist(products: [Product]) async throws {
        wishlist = products
    }
}
