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
    
    var parser = DeepLinkParser()
    
    var body: some View {
        TabView(selection: $selectedTab) {
            coordinatSceneFactory.makeHomeCoordinatorView()
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
            print("Received URL:", url)

            guard let deepLink = parser.parse(url: url) else {
                print("Invalid deep link")
                return
            }

            print("Parsed:", deepLink)
            
            switch deepLink {
                
            case .product(id: 5):
                selectedTab = .shop
            case .dashboard:
                selectedTab = .wishlist
                
            default:
                selectedTab = .home
            }
            
        }
    }
}
