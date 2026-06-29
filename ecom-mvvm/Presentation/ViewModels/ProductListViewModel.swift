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
}
