import Foundation

final class CoordinatorSceneFactory {
    
    func makeMainTabView() -> MainTabView {
        return MainTabView(coordinatSceneFactory: self)
    }
    
    func makeHomeCoordinatorView() -> HomeCoordinatorView {
        let homeSceneFactory = HomeSceneFactory()
        let homeView = homeSceneFactory.makeHomeView()
        
        return HomeCoordinatorView(homeView: homeView)
    }
    
    func makeWishlistView() -> WishListView {
        let wishlistSceneFactory = WishlistSceneFactory()
        
        return wishlistSceneFactory.makeWishlistView()
    }
    
    func handleDeepLink(_ deepLink: DeepLink) {
        switch deepLink {
        
        case .product(let id):
            print("I am in .product with id: \(id)")
            break
        
        case .dashboard:
            self.makeWishlistView()
            break
        }
    }
    
}
