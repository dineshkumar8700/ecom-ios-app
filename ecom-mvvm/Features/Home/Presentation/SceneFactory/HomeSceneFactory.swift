import Foundation
import Resolver

final class HomeSceneFactory {

    private let appContainer: AppContainer

    init(appContainer: AppContainer) {
        self.appContainer = appContainer
    }

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
