import SwiftUI

struct HomeView: View {
    let vm: ProductListViewModel

    var body: some View {

        TabView {
            HomeCoordinatorView(vm:vm)
                .tabItem {
                    Label("Home", systemImage: "house")
            }
            NavigationStack {
                Text("Shop")
            }
                .tabItem {
                    Label("Shop", systemImage: "magnifyingglass")
            }
            NavigationStack {
                Text("Cart")
            }
                .tabItem {
                    Label("Cart", systemImage: "cart")
            }
            NavigationStack {
                Text("Account")
            }
                .tabItem {
                    Label("Account", systemImage: "person")
            }
        }
    }
}
