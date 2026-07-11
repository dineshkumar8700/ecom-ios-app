import Foundation
import Resolver

final class ProductDetailSceneFactory {
    func makeProductDetailView(id: Int) -> ProductDetailView {
        
        let useCase = FetchProductDetailUsecase(repository: Resolver.resolve())
        let viewModel = ProductDetailViewModel(useCase: useCase)
        
        return ProductDetailView(id: id, vm: viewModel)
    }
}
