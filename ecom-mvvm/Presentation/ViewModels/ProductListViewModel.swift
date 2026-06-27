import Foundation
import Combine

@MainActor
@Observable
class ProductListViewModel {
    private(set) var state = ProductListState()
    
    private let fetchProductUsecase: FetchProductUseCase
    
    init(fetchProductUsecase: FetchProductUseCase) {
        self.fetchProductUsecase = fetchProductUsecase
    }
    
    private func fetchProducts() async {
        do {
            state.products = try await fetchProductUsecase.execute()
            state.isLoading = false
        } catch {
            state.error = error.localizedDescription
        }
    }
    
    func send(action: ProductListAction) async {
        switch action {
        case .onAppear:
            await self.fetchProducts()
        }
    }
}
