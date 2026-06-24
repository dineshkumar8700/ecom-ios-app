//
//  ProductRepoImpl.swift
//  ecom-mvvm
//
//  Created by Dinesh Kumar on 24/06/26.
//

import Foundation

class ProductRepositoryImpl: ProductRepository{
    private let service: ProductService
    
    init(service: ProductService) {
        self.service = service
    }
    
    func getProducts() async throws -> [Product] {
        return try await service.fetchProducts()
    }
    
}
