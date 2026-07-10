import Foundation
import SwiftUI

struct HomeCoordinatorView: View {

    let homeView: ProductListView
    let productDetailViewModel: ProductDetailViewModel

    @StateObject
    private var coordinator = HomeCoordinator()

    var body: some View {

        NavigationStack(path: $coordinator.path) {

            homeView
                .navigationDestination(for: HomeRoute.self) { route in
                    switch route {
                    case .productDetail(let id):
                        ProductDetailView(
                            id: id ,
                            vm: productDetailViewModel
                        )

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
