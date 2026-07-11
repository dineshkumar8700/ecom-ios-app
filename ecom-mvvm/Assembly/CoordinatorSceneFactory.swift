import Foundation
import SwiftUI

final class CoordinatorSceneFactory {
    
    func makeMainTabView() -> MainTabView {
        return MainTabView(csf: self)
    }
    
    func makeHomeCoordinatorView(coordinator: HomeCoordinator) -> HomeCoordinatorView {
        let homeSceneFactory = HomeSceneFactory()
        let productSceneFactory = ProductDetailSceneFactory()
        
        return HomeCoordinatorView(
            homeSceneFactory: homeSceneFactory,
            productDetailSceneFactory: productSceneFactory,
            coordinator: coordinator
        )
    }
    
    func makeWishlistView() -> WishListView {
        let wishlistSceneFactory = WishlistSceneFactory()
        
        return wishlistSceneFactory.makeWishlistView()
    }
}
