import Foundation

protocol WishlistRepositoryProtocol {

    func fetchWishlist() async throws -> [Product]

    func saveWishlist(_ products: [Product]) async throws
}
