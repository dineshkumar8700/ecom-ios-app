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
                PrimaryButton(label: "Shop") {
                    print("Shop Button")
                }
            }
            .tabItem {
                Label("Shop", systemImage: "magnifyingglass")
            }

            NavigationStack {
                Text("Cart")
                PrimaryButton(label: "Cart") {
                    print("Cart Button")
                }
            }
            .tabItem {
                Label("Cart", systemImage: "cart")
            }
            NavigationStack {
                coordinatSceneFactory.makeWishlistView()
            
            }
            .tabItem {
                Label("Wishlist", systemImage: "heart")
            }

            NavigationStack {
                Text("Account")
                PrimaryButton(label: "Account") {
                    print("Account Button")
                }
            }
            .tabItem {
                Label("Account", systemImage: "person")
            }
        }
    }
}
