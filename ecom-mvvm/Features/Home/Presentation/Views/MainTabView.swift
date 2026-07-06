import SwiftUI

struct MainTabView: View {
    let homeView: ProductListView

    var body: some View {
        TabView {
            HomeCoordinatorView(homeView: homeView)
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
