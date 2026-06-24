//
//  Home.swift
//  ecom-mvvm
//
//  Created by Dinesh Kumar on 24/06/26.
//

import Foundation
import SwiftUI

struct ProductImage: View {
    let image: String
    
    var body: some View {
        AsyncImage(url: URL(string: image)) { image in
            image
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
        } placeholder: {
            Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80)
                    .foregroundStyle(.gray)
        }.padding(10)
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
    
    var body: some View {
        HStack {
            ProductImage(image: product.image)
            ProductTitle(title: product.title)
            Spacer()
            ProductPrice(price: product.price)
    
        }
    }
}

struct ProductListView: View {
    @StateObject private var vm: ProductListViewModel
    
    init(vm: ProductListViewModel) {
        _vm = StateObject(wrappedValue: vm)
    }
    
    var body: some View {
        VStack {
            Text("Product List")
                .font(.title)
                .fontWeight(.bold)
            
            List(vm.products) { product in
                ProductDetailRow(product: product)

            }.listStyle(.plain)
                
        }
        .task {
            await vm.fetchProducts()
        }
    }
}
