import Foundation

final class ToggleWishlistUseCase {

    let repository: WishlistRepositoryProtocol
    let store: WishlistStore

    init(repository: WishlistRepositoryProtocol, store: WishlistStore) {
        self.repository = repository
        self.store = store
    }

    func execute(_ product: Product) async throws {
        store.toggle(product)

        try await repository.saveWishlist(store.products)
    }
}
