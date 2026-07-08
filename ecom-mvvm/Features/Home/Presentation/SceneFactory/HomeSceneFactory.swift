import Foundation

final class HomeSceneFactory {

    private let appContainer: AppContainer

    init(appContainer: AppContainer) {
        self.appContainer = appContainer
    }

    func makeHomeView() -> ProductListView {

        let service = ProductServiceImpl(network: appContainer.network)
        let repository = ProductRepositoryImpl(service: service)
        let useCase = FetchProductUseCase(repository: repository)
        
        let viewModel = ProductListViewModel(
            fetchProductUsecase: useCase,
            wishlistStore: appContainer.wishlistStore,
            toggleWishlistUseCase: appContainer.toggleWishlistUseCase
        )
        
        return ProductListView(vm: viewModel)
    }
}
