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
    let vm: ProductListViewModel
    
    @EnvironmentObject var coordinator: HomeCoordinator
    @EnvironmentObject var store: WishlistStore
    
    var body: some View {
        Button {
            vm.analytics.logEvent(name: "prodcut_tapped", parameters: [
                "product_id": product.id, "product_title": product.title
            ])
            coordinator.push(.productDetail(product: product))
        } label: {
            HStack {
                ProductImage(image: product.image)
                VStack(alignment: .leading, spacing: 6) {
                    ProductTitle(title: product.title)
                    ProductRating(rating: product.rating)
                    ProductPrice(price: product.price)
                    Button {
                        Task {
                            await vm.toggle(product)
                        }
                        
                    } label: {
                        HStack {
                            Image(
                                systemName: store.contains(product)
                                    ? "heart.fill"
                                    : "heart"
                            )
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.vertical, 10)

                        }
                    }.buttonStyle(.plain)
                }
            }
        }
    }
}

struct ProductList: View {
    let vm: ProductListViewModel
    let onRefresh: () async -> Void
    
    var body: some View {
        List {
            Text("Product List")
                .font(.title)
                .fontWeight(.bold)
            
            ForEach(vm.state.products) {
                ProductDetailRow(product: $0, vm: vm)
            }
        
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
    @ObservedObject var vm: ProductListViewModel

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
                ProductList(
                    vm: vm,
                    onRefresh: refresh,
                )
            }
            
        }
        .task {
            await load()
        }
        .environmentObject(vm.wishlistStore)
    }
}
