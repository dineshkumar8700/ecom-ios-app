import Foundation
import Combine

@MainActor
final class WishlistViewModel: ObservableObject {

    let store: WishlistStore
    let fetchWishlist: FetchWishlistUseCase

    init(
        store: WishlistStore,
        fetchWishlist: FetchWishlistUseCase
    ) {
        self.store = store
        self.fetchWishlist = fetchWishlist
    }

    var wishlist: [Product] {
        store.products
    }

    func load() async {
        try? await fetchWishlist.execute()
    }
}
