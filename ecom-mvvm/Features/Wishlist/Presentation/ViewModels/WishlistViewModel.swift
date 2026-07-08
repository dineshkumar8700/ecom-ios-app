import Foundation
import Combine

@MainActor
final class WishlistViewModel {

    private let fetchWishlist: FetchWishlistUseCase
    private let toggleWishlist: ToggleWishlistUseCase

    init(
        fetchWishlist: FetchWishlistUseCase,
        toggleWishlist: ToggleWishlistUseCase
    ) {
        self.fetchWishlist = fetchWishlist
        self.toggleWishlist = toggleWishlist
    }

    func load() async {
        try? await fetchWishlist.execute()
    }

    func remove(_ product: Product) async {
        try? await toggleWishlist.execute(product)
    }
}
