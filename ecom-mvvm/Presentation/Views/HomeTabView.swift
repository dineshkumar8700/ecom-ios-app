import SwiftUI

struct HomeTabView: View {
    var vm: ProductListViewModel
    
    var body: some View {
        NavigationStack {
            ProductListView(vm: vm)
                .navigationDestination(for: ProductRoute.self) { route in
                    switch route {
                    case .product(let product):
                        ProductDetailView(product: product)

                    case .checkout:
                        CheckoutView()
                    }
                }
        }
    }
}
