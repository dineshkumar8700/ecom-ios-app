import SwiftUI

@main
struct ecom_mvvmApp: App {
    var body: some Scene {
        WindowGroup {
            let network = URLSessionNetworkClient()
            let service = ProductServiceImpl(network: network)
            let repository = ProductRepositoryImpl(service: service)
            let useCase = FetchProductUseCase(repository: repository)
            let viewModel = ProductListViewModel(fetchProductUsecase: useCase)
            
            HomeView(vm: viewModel)
        }
    }
}
