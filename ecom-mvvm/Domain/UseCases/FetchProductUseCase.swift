//
//  FetchProductUseCase.swift
//  ecom-mvvm
//
//  Created by Dinesh Kumar on 24/06/26.
//

import Foundation

struct FetchProductUseCase {
    private let repository: ProductRepository
    
    init(repository: ProductRepository) {
        self.repository = repository
    }
    
    func execute() async throws -> [Product] {
        return try await repository.getProducts()
    }
}
