import Foundation
import Combine

class ProductDetailViewModel: ObservableObject {
    var useCase: FetchProductDetailUsecaseProtocol
    
    init(useCase: FetchProductDetailUsecaseProtocol) {
        self.useCase = useCase
    }
    
    @Published var product: Product? = nil
    @Published var isLoading: Bool = false
    @Published var error: Error? = nil
    
    private func fetchProduct(id: Int) async {
        isLoading = true
        
        defer {
            isLoading = false
        }
        
        do {
            product = try await useCase.execute(id: id)
        } catch {
            self.error = error
        }
    }
    
    func send(_ action: ProductDetailViewActions) async  {
        switch action {
            
        case .appear(let id) :
            await fetchProduct(id: id)
        }
    }
}
