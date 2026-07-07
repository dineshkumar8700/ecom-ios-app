import Foundation
import SwiftUI
import Combine

final class WishlistRepository: WishlistRepositoryProtocol {

    let service: WishlistServiceProtocol

    init(service: WishlistServiceProtocol) {
        self.service = service
    }

    func fetchWishlist() async throws -> [Product] {
        try await self.service.fetchWishlist()
    }

    func saveWishlist(_ products: [Product]) async throws {
        try await self.service.saveWishlist(products: products)
    }
}
