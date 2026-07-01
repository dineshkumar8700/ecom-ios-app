import SwiftUI

struct HomeTabView: View {
    var vm: ProductListViewModel
    @StateObject var coordinator = AppCoordinator()
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            ProductListView(vm: vm)
                .navigationDestination(for: AppRoute.self) { route in
                    switch route {
                        
                    case .productDetail(let product):
                        ProductDetailView(product: product)
                    case .checkout:
                        CheckoutView()
                    }
                }

        }
        .environmentObject(coordinator)
    }
}
