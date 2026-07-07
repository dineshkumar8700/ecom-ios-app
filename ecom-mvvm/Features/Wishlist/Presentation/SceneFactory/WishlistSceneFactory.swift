import Foundation

class WishlistSceneFactory {
    private let appContainer: AppContainer

    init(appContainer: AppContainer) {
        self.appContainer = appContainer
    }

    func makeWishlistView() -> WishListView {

        let wishlistViewModel = WishlistViewModel(
            store: appContainer.wishlistStore,
            fetchWishlist: FetchWishlistUseCase(
                repository: appContainer.wishlistRepository,
                store: appContainer.wishlistStore
            )
        )

        return WishListView(vm: wishlistViewModel)
    }
}
