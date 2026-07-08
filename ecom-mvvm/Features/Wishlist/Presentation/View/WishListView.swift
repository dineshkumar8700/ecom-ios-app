import Foundation
import SwiftUI

struct WishListView: View {
    @ObservedObject var store: WishlistStore
    let vm: WishlistViewModel

    var body: some View {
        VStack {
            Text("Wishlist")
                .font(.title)
                .fontWeight(.bold)
            
            if(store.products.isEmpty) {
                Text("No items in the wishlist")
            } else {
                List(store.products) { product in
                    HStack {
                        Text(product.title)

                        Spacer()

                        Button {
                            Task {
                                await vm.remove(product)
                            }
                        } label: {
                            Image(systemName: "trash")
                                .frame(width: 14, height: 14)
                                .foregroundStyle(.red)
                        }
                        .buttonStyle(.plain)
                    }
                }
                .listStyle(.plain)
            }


        }
        .task {
            await vm.load()
        }
    }
}
