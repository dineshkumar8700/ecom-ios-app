//
//  ProductRepo.swift
//  ecom-mvvm
//
//  Created by Dinesh Kumar on 24/06/26.
//

import Foundation

protocol ProductRepository {
    func getProducts() async throws -> [Product]
}
