import Foundation
import Resolver

final class HomeSceneFactory {
    
    func makeHomeViewModel() -> ProductListViewModel {
        
        let viewModel = ProductListViewModel(
            fetchProductUsecase: Resolver.resolve(),
            wishlistStore: Resolver.resolve(),
            toggleWishlistUseCase: Resolver.resolve()
        )
        
        return viewModel
    }
    
    func makeHomeView(vm: ProductListViewModel) -> ProductListView {
        
        return ProductListView(vm: vm)
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
