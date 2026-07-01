//
//  TabView.swift
//  ecom-mvvm
//
//  Created by Dinesh Kumar on 30/06/26.
//

import SwiftUI

struct TabViewExample: View {
    var body: some View {
        TabView {
            VStack {
                Text("Settings")
                Button("Hii") {
                    print("okh")
                }
            }
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
            Text("Cart")
                .tabItem {
                    Label("Cart", systemImage: "cart")
                }
            Text("Profile")
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
            LoginView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
        }
        .tabViewStyle(.tabBarOnly)
    }
}

#Preview {
    TabViewExample()
}
