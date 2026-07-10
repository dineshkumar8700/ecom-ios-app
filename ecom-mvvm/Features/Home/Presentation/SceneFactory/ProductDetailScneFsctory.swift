import Foundation
import Resolver

final class ProductDetailScneFsctory {
    func makeProductDetailViewModel() -> ProductDetailViewModel {
        
        let service = ProductServiceImpl(network: Resolver.resolve())
        let repository = ProductRepositoryImpl(service: Resolver.resolve())
        let useCase = FetchProductDetailUsecase(repository: Resolver.resolve())
        let viewModel = ProductDetailViewModel(useCase: useCase)
        
        return viewModel
    }
}
