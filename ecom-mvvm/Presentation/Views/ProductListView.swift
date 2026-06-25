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
    
    var body: some View {
        NavigationLink(value: product) {
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

struct ProductListView: View {
    @ObservedObject private var vm: ProductListViewModel
    
    init(vm: ProductListViewModel) {
        self.vm = vm
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
