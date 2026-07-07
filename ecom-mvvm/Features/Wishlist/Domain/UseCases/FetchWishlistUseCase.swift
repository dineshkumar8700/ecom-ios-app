final class FetchWishlistUseCase {

    let repository: WishlistRepositoryProtocol
    let store: WishlistStore

    init(repository: WishlistRepositoryProtocol, store: WishlistStore ) {
        self.repository = repository
        self.store = store
    }

    func execute() async throws {
        let products = try await repository.fetchWishlist()
        print(products)
        store.setProducts(products)
    }
}
