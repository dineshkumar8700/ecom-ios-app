import Foundation
import Combine

@MainActor
class ProductListViewModel: ObservableObject {
    @Published private(set) var state = ProductListState()
    
    private var fetchProductUsecase: FetchProductUseCaseProtocol
    let wishlistStore: WishlistStore
    private let toggleWishlistUseCase: ToggleWishlistUseCase
    let analytics: AnalyticsService
    
    init(
        fetchProductUsecase: FetchProductUseCaseProtocol,
        wishlistStore: WishlistStore,
        toggleWishlistUseCase: ToggleWishlistUseCase,
        analytics: AnalyticsService
    ) {
        self.fetchProductUsecase = fetchProductUsecase
        self.wishlistStore = wishlistStore
        self.toggleWishlistUseCase = toggleWishlistUseCase
        self.analytics = analytics
    }
    
    private func fetchProducts() async {
        guard state.products.isEmpty else { return }
        
        await self.loadProducts(showLoader: true)
    }
    
    private func refreshProducts() async {
        await self.loadProducts(showLoader: false)
    }
    
    private func loadProducts(showLoader: Bool) async {
        if(showLoader) {
            state.isLoading = true
        }
        
        defer {
            state.isLoading = false
        }
        
        do {
            state.products = try await fetchProductUsecase.execute()
        } catch {
            state.error = error.localizedDescription
        }
    }
    
    func send(action: ProductListAction) async {
        switch action {
        case .onAppear:
            await self.fetchProducts()
        case .onRefresh:
            await self.refreshProducts()
        }
    
    }
    
    func isWishlisted(_ product: Product) -> Bool {
        wishlistStore.contains(product)
    }

    func toggle(_ product: Product) async {
        try? await toggleWishlistUseCase.execute(product)
    }
}
