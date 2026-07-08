import Foundation

final class AppContainer {

    let network = URLSessionNetworkClient()
    
    let wishlistStore = WishlistStore()

    let wishlistRepository: WishlistRepositoryProtocol

    lazy var fetchWishlistUseCase = FetchWishlistUseCase(
        repository: wishlistRepository,
        store: wishlistStore
    )

    lazy var toggleWishlistUseCase = ToggleWishlistUseCase(
        repository: wishlistRepository,
        store: wishlistStore
    )

    init() {
        wishlistRepository = WishlistRepository(service: WishlistService())
    }
    
    let analytics: AnalyticsService = FirebaseAnalyticsService()
}
