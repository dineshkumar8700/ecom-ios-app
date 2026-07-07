import Foundation
import SwiftUI

struct WishListView: View {
    var vm: WishlistViewModel
    
    var body: some View {
        Text("Wishlist")
            .font(.title)
            .fontWeight(.bold)
        
        List(vm.wishlist) { product in
            HStack {
                Text(product.title)
                
                Spacer()
                
                Button {
                    
                } label: {
                    Image(systemName: "trash")
                        .frame(width: 14, height: 14)
                        .foregroundStyle(.red)
                }
                .buttonStyle(.plain)
            
            }
        }
        .listStyle(.plain)
        .task() {
            await vm.load()
        }
    }
        
        
}
