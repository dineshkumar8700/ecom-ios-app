import Foundation
import Resolver

class WishlistSceneFactory {
    private let appContainer: AppContainer

    init(appContainer: AppContainer) {
        self.appContainer = appContainer
    }

    func makeWishlistView() -> WishListView {

        let wishlistViewModel = WishlistViewModel(
            fetchWishlist: Resolver.resolve(),
            toggleWishlist: Resolver.resolve()
        )

        return WishListView(
            store: Resolver.resolve(),
            vm: wishlistViewModel
        )
    }
}
