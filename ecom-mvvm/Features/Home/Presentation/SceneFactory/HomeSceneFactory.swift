import Foundation
import Resolver

final class HomeSceneFactory {
    
    func makeHomeView() -> ProductListView {

        let service = ProductServiceImpl(network: Resolver.resolve())
        let repository = ProductRepositoryImpl(service: Resolver.resolve())
        let useCase = FetchProductUseCase(repository: Resolver.resolve())
        
        let viewModel = ProductListViewModel(
            fetchProductUsecase: Resolver.resolve(),
            wishlistStore: Resolver.resolve(),
            toggleWishlistUseCase: Resolver.resolve()
        )
        
        return ProductListView(vm: viewModel)
    }
}
