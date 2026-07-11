import Foundation
import Resolver

final class HomeSceneFactory {
    
    func makeHomeView() -> ProductListView {
        
        let viewModel = ProductListViewModel(
            fetchProductUsecase: Resolver.resolve(),
            wishlistStore: Resolver.resolve(),
            toggleWishlistUseCase: Resolver.resolve()
        )
        
        return ProductListView(vm: viewModel)
    }
    
    func makeProductDetailView(id: Int) -> ProductDetailView {
        
        let useCase = FetchProductDetailUsecase(repository: Resolver.resolve())
        let viewModel = ProductDetailViewModel(useCase: useCase)
        
        return ProductDetailView(id: id, vm: viewModel)
    }
    
    func makeCheckoutView() -> CheckoutView {
        CheckoutView()
    }
}
