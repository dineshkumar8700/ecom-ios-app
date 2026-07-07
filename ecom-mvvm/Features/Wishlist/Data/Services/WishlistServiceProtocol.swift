import Foundation

protocol WishlistServiceProtocol {
    func fetchWishlist() async throws -> [Product]
    
    func saveWishlist(products: [Product]) async throws
}
