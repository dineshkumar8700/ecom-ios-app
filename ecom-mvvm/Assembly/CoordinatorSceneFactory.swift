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
        )
    }
    
    func makeWishlistView() -> WishListView {
        let wishlistSceneFactory = WishlistSceneFactory(appContainer: appContainer)
        
        return wishlistSceneFactory.makeWishlistView()
    }
    
}
