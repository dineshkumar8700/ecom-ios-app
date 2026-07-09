import Foundation
import Resolver

class WishlistSceneFactory {
    
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
