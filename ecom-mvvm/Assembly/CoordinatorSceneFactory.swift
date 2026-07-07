import Foundation

final class CoordinatorSceneFactory {

    private let appContainer: AppContainer

    init(appContainer: AppContainer) {
        self.appContainer = appContainer
    }
    
    func makeMainTabView() -> MainTabView {
        return MainTabView(
            coordinatSceneFactory: self
        )
    }
    
    func makeHomeCoordinatorView() -> HomeCoordinatorView {
        let homeSceneFactory = HomeSceneFactory(appContainer: appContainer)
        
        return HomeCoordinatorView(
            homeView: homeSceneFactory.makeHomeView(),
            wishlistRepository: appContainer.wishlistRepository
        )
    }
    
    func makeWishlistView() -> WishListView {

        let vm = WishlistViewModel(
            store: appContainer.wishlistStore,
            fetchWishlist: appContainer.fetchWishlistUseCase
        )

        return WishListView(vm: vm)
    }
    
}
