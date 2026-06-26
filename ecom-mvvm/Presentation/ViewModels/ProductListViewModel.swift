import Foundation
import Combine

@MainActor
class ProductListViewModel: ObservableObject {
    @Published private(set) var state = ProductListState()
    
    private let fetchProductUsecase: FetchProductUseCase
    
    init(fetchProductUsecase: FetchProductUseCase) {
        self.fetchProductUsecase = fetchProductUsecase
    }
    
    private func fetchProducts() async {
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
        }
    }
}
