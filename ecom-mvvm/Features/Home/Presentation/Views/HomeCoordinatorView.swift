import Foundation
import SwiftUI

struct HomeCoordinatorView: View {

    let homeSceneFactory: HomeSceneFactory
    let productDetailSceneFactory: ProductDetailSceneFactory
    @ObservedObject var coordinator: HomeCoordinator

    var body: some View {

        NavigationStack(path: $coordinator.path) {

            homeSceneFactory.makeHomeView()
                .navigationDestination(for: HomeRoute.self) { route in
                    switch route {
                    case .productDetail(let id):
                        productDetailSceneFactory.makeProductDetailView(id: id)

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
