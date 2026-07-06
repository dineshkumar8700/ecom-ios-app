import SwiftUI

struct MainTabView: View {
    let coordinatSceneFactory: CoordinatorSceneFactory

    var body: some View {
        TabView {
            coordinatSceneFactory.makeHomeCoordinatorView()
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
                Text("Wishlist")
            }
            .tabItem {
                Label("Wishlist", systemImage: "heart")
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
