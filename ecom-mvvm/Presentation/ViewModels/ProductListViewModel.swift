//
//  HomeViewModel.swift
//  ecom-mvvm
//
//  Created by Dinesh Kumar on 24/06/26.
//

import Foundation
import Combine

@MainActor
class ProductListViewModel: ObservableObject {
    @Published var products: [Product] = []
    private let fetchProductUsecase: FetchProductUseCase
    
    init(fetchProductUsecase: FetchProductUseCase) {
        self.fetchProductUsecase = fetchProductUsecase
    }
    
    func fetchProducts() async {
        do {
            products = try await fetchProductUsecase.execute()
        } catch {
            print(error)
        }
    }
}
