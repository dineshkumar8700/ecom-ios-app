import Foundation

final class CoordinatorSceneFactory {
    
    func makeMainTabView() -> MainTabView {
        return MainTabView(coordinatSceneFactory: self)
    }
    
    func makeHomeCoordinatorView() -> HomeCoordinatorView {
        let homeSceneFactory = HomeSceneFactory()
        let homeView = homeSceneFactory.makeHomeView()
        let productSceneFactory = ProductDetailScneFsctory()
        
        return HomeCoordinatorView(
            homeView: homeView,
            productDetailViewModel: productSceneFactory
                .makeProductDetailViewModel()
        )
    }
    
    func makeWishlistView() -> WishListView {
        let wishlistSceneFactory = WishlistSceneFactory()
        
        return wishlistSceneFactory.makeWishlistView()
    }
    
}
