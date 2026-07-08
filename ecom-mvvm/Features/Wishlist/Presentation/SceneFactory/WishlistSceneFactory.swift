import Foundation

class WishlistSceneFactory {
    private let appContainer: AppContainer

    init(appContainer: AppContainer) {
        self.appContainer = appContainer
    }

    func makeWishlistView() -> WishListView {

        let wishlistViewModel = WishlistViewModel(
            fetchWishlist: appContainer.fetchWishlistUseCase,
            toggleWishlist: appContainer.toggleWishlistUseCase)

        return WishListView(
            store: appContainer.wishlistStore,
            vm: wishlistViewModel
        )
    }
}
