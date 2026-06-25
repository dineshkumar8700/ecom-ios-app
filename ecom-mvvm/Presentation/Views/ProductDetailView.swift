import Foundation
import SwiftUI

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
            AsyncImage(url: URL(string: product.image)) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity, maxHeight: 300)
                    .cornerRadius(10)
            } placeholder: {
                Image(systemName: "photo")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity, maxHeight: 300)
                        .foregroundStyle(.gray)
                        .cornerRadius(10)
            }.padding(10)
            
            DisplayText(text: product.title)
            DisplayText(text: "$\(product.price)")
            NavigationLink {
                CheckoutView()
            } label: {
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
