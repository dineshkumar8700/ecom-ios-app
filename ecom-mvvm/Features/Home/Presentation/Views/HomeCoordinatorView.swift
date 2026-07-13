import Foundation
import SwiftUI

struct HomeCoordinatorView: View {

    let sceneFactory: HomeSceneFactory
    @ObservedObject var coordinator: HomeCoordinator
    @StateObject private var vm: ProductListViewModel
    
    init(
        coordinator: HomeCoordinator,
        sceneFactory: HomeSceneFactory
    ) {
        self.coordinator = coordinator
        self.sceneFactory = sceneFactory
        _vm = StateObject(
            wrappedValue: sceneFactory.makeHomeViewModel()
        )
    }

    var body: some View {

        NavigationStack(path: $coordinator.path) {

            sceneFactory.makeHomeView(vm: vm)
                .navigationDestination(for: HomeRoute.self) { route in
                    switch route {
                    case .productDetail(let id):
                        sceneFactory.makeProductDetailView(id: id)

                    case .checkout:
                        sceneFactory.makeCheckoutView()
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
