import Foundation
import SwiftUI

struct CheckoutView : View {
    
    var body: some View {
        VStack {
            Text("Checkout")
        }
    }
}

struct DisplayText: View {
    let text: String?
    var body: some View {
        
        Text(text!)
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(.system(size: 14))
            .bold()
            .padding(.bottom, 10)
    }
}

struct BuyButton: View {
    let price: Double?
    
    var body: some View {
            Text("""
                Buy Now 
                at $\(price!, specifier: "%.2f")
                """)
                .frame(alignment: .leading)
                .padding(.horizontal, 14)
                .padding(.vertical, 10)
                .font(.system(size: 12))
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
    }
}

struct ProductDetailView: View {
    let id: Int
    
    @StateObject private var vm: ProductDetailViewModel
    @EnvironmentObject var coordinator: HomeCoordinator
    
    init(id: Int, useCase: FetchProductDetailUsecaseProtocol ) {
        self.id = id
        _vm = StateObject( wrappedValue: ProductDetailViewModel( useCase: useCase))
    }
    
    var body: some View {
        
        VStack {
            if(vm.isLoading) {
                ProgressView()
            } else if let product = vm.product {
                RemoteImage(url: URL(string: product.image)!)
                    .frame(maxWidth: .infinity, maxHeight: 300)
                    .cornerRadius(10)
                    .padding(10)
                
                DisplayText(text: product.title)
                DisplayText(text: "$\(product.price)")
                
                Button {
                    coordinator.push(.checkout)
                } label: {
                    HStack {
                        BuyButton(price: product.price)
                        Spacer()
                    }
                }.buttonStyle(.plain)
                
                Spacer()
            } else {
                Text("Product Not Found: \(id)")
            }
        }
        .padding()
        .task {
            await vm.send(.appear(id: id))
        }
    }
}
	
