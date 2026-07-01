import Foundation
import SwiftUI

struct ProductImage: View {
    let image: String
    
    var body: some View {
        
        RemoteImage(url: URL(string: image)!)
            .frame(width: 80, height: 80)
            .padding(10)
    }
}

struct ProductRating: View {
    let rating: Rating
    let maxRating: Int = 5
    
    var body: some View {
        HStack(spacing: 2) {
            ForEach(0..<maxRating, id: \.self) { index in
                Image(systemName: starType(for: index))
                    .resizable()
                    .frame(width: 12, height: 12)
                    .foregroundStyle(.yellow)
            }
            Text("(\(rating.count))")
                .font(Font.system(size: 12))
                .foregroundStyle(.gray)
        }
    }
    
    private func starType(for index: Int) -> String {
        let starNumber = Double(index + 1)
        
        if rating.rate >= starNumber { return "star.fill" }
        if rating.rate >= starNumber - 0.5 { return "star.leadinghalf.filled" }
        
        return "star"
    }
}

struct ProductTitle: View {
    let title: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.system(size: 14))
                .lineSpacing(0.4)
                .fontWeight(.semibold)
        }
    }
}

struct ProductPrice: View {
    let price: Double
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("$\(price.formatted())")
                .font(.system(size: 14))
                .fontWeight(.semibold)
        }
    }
}

struct ProductDetailRow: View {
    let product: Product
    
    @EnvironmentObject var coordinator: AppCoordinator
    
    var body: some View {
        Button {
            coordinator.showProduct(product: product)
        } label: {
            HStack {
                ProductImage(image: product.image)
                VStack(alignment: .leading, spacing: 6) {
                    ProductTitle(title: product.title)
                    ProductRating(rating: product.rating)
                    ProductPrice(price: product.price)
                }
            }
        }
    }
}

struct ProductList: View {
    let products: [Product]
    let onRefresh: () async -> Void
    
    var body: some View {
        Text("Product List")
            .font(.title)
            .fontWeight(.bold)
        
        List(products) { product in
            ProductDetailRow(product: product)

        }
        .listStyle(.plain)
        .refreshable {
            await onRefresh()
        }
    }
}

struct LoadingView: View {
    var body: some View {
        ProgressView()
        Text("Loading...")
    }
}

struct ErrorView: View {
    let retry: () async -> Void
    
    var body: some View {
        VStack {
            Text("Something went wrong")
            Button("Retry") {
                Task {
                    await retry()
                }
            }
        }
    }
}

struct ProductListView: View {
    var vm: ProductListViewModel

    var body: some View {
        let load = {
            await vm.send(action: .onAppear)
        }
        
        let refresh = {
            await vm.send(action: .onRefresh)
        }
        
        VStack {
            if(vm.state.isLoading) {
                LoadingView()
            } else if vm.state.error != nil {
                ErrorView(retry: load)
            }
            else {
                ProductList(products: vm.state.products, onRefresh: refresh)
            }
            
        }
        .task {
            await load()
        }
    }
}
