import Foundation
import SwiftUI
import NukeUI

struct CheckoutView : View {
    var body: some View {
        Text("Checkout")
    }
}

struct DisplayText: View {
    let text: String
    var body: some View {
        
        Text(text)
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(.system(size: 14))
            .bold()
            .padding(.bottom, 10)
    }
}

struct BuyButton: View {
    let price: Double
    
    var body: some View {
            Text("""
                Buy Now 
                at $\(price, specifier: "%.2f")
                """)
                .padding(.horizontal, 14)
                .padding(.vertical, 10)
                .frame(alignment: .leading)
                .font(.system(size: 12))
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
    }
}

struct ProductDetailView: View {
    let product: Product
    
    var body: some View {
        VStack {
            LazyImage(url: URL(string: product.image)) { state in
                if let image = state.image {
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity, maxHeight: 300)
                        .cornerRadius(10)
                } else {
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity, maxHeight: 300)
                        .foregroundStyle(.gray)
                        .cornerRadius(10)
                    
                }
                
            }.padding(10)
            
            DisplayText(text: product.title)
            DisplayText(text: "$\(product.price)")
            
            NavigationLink(value: ProductRoute.checkout) {
                HStack {
                    BuyButton(price: product.price)
                    Spacer()
                }
            }

            Spacer()
        }
        .padding()
        
    }
}
