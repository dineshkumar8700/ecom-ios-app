//
//  ProductListState.swift
//  ecom-mvvm
//
//  Created by Dinesh Kumar on 26/06/26.
//

import Foundation

struct ProductListState {
    var products: [Product] = []
    var isLoading: Bool = true
    var error: String?
}
