//
//  ProductService.swift
//  ecom-mvvm
//
//  Created by Dinesh Kumar on 24/06/26.
//

import Foundation

enum ProductError: Error {
    case invalidURL
    case badResponse
    case invalidJSON
}

class ProductService {
    func fetchProducts() async throws -> [Product] {
        guard let url = URL(string: "https://fakestoreapi.com/products") else {
            throw ProductError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw ProductError.badResponse
        }
        
        guard let products = try? JSONDecoder().decode([Product].self, from: data) else {
            throw ProductError.invalidJSON
        }
        
        return products
    }
}


