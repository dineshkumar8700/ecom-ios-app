//
//  Home.swift
//  ecom-mvvm
//
//  Created by Dinesh Kumar on 24/06/26.
//

import Foundation
import SwiftUI

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
                HStack {
                    AsyncImage(url: URL(string: product.image)) { image in
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
                        
                    Text(product.title)
                        .font(.system(size: 14))
                        .lineSpacing(0.4)
                        .fontWeight(.semibold)
                    Spacer()
                    
                    Text("$\(product.price.formatted())")
                        .font(.system(size: 14))
                        .fontWeight(.semibold)
                }

            }.listStyle(.plain)
                
            Spacer()
        }
        .task {
            await vm.fetchProducts()
        }
    }
}
