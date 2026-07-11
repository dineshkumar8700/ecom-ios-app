import SwiftUI

enum Tab: Hashable {
    case home
    case shop
    case wishlist
    case profile
}

struct MainTabView: View {
    let coordinatSceneFactory: CoordinatorSceneFactory
    
    @State var selectedTab: Tab = .home
    @StateObject var coordinator = HomeCoordinator()
    
    init(csf: CoordinatorSceneFactory) {
        self.coordinatSceneFactory = csf
    }

    var parser = DeepLinkParser()
    
    var body: some View {
        TabView(selection: $selectedTab) {
            coordinatSceneFactory
                .makeHomeCoordinatorView(coordinator: coordinator)
                .tabItem {
                    Label("Home", systemImage: "house")
                }
                .tag(Tab.home)

            NavigationStack {
                Text("Shop")
                PrimaryButton(label: "Shop") {
                    print("Shop Button")
                }
            }
            .tabItem {
                Label("Shop", systemImage: "magnifyingglass")
            }
            .tag(Tab.shop)

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
            .tag(Tab.wishlist)

            NavigationStack {
                Text("Account")
                PrimaryButton(label: "Account") {
                    print("Account Button")
                }
            }
            .tabItem {
                Label("Account", systemImage: "person")
            }
            .tag(Tab.profile)
        }
        .onOpenURL { url in

            guard let deepLink = parser.parse(url: url) else { return }
            
            switch deepLink {
                
            case .product(let id):
                selectedTab = .home
                coordinator.push(.productDetail(id: id))
            case .wishlist:
                selectedTab = .wishlist
            }
        }
    }
}
