import Foundation
import SwiftUI

struct HomeCoordinatorView: View {

    let homeView: ProductListView

    @StateObject
    private var coordinator = HomeCoordinator()

    var body: some View {

        NavigationStack(path: $coordinator.path) {

            homeView
                .navigationDestination(for: HomeRoute.self) { route in
                    switch route {
                    case .productDetail(let product):
                        ProductDetailView(product: product)

                    case .checkout:
                        CheckoutView()
                    }
                }
        }
        .sheet(item: $coordinator.sheet) { sheet in
            switch sheet {
            case .Settings:
                SettingSheet()
                    .presentationDetents([.medium, .large])
                    .interactiveDismissDisabled()
            }
        }
        .environmentObject(coordinator)
    }
}
