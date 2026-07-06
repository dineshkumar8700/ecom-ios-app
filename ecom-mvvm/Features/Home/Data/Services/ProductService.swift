//
//  ProductService.swift
//  ecom-mvvm
//
//  Created by Dinesh Kumar on 30/06/26.
//

import Foundation

protocol ProductService {
    func fetchProducts() async throws -> [Product]
}
