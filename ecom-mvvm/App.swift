//
//  ecom_mvvmApp.swift
//  ecom-mvvm
//
//  Created by Dinesh Kumar on 24/06/26.
//

import SwiftUI

@main
struct ecom_mvvmApp: App {
    var body: some Scene {
        WindowGroup {
            let service = ProductService()
            let repository = ProductRepositoryImpl(service: service)
            let useCase = FetchProductUseCase(repository: repository)
            let viewModel = ProductListViewModel(fetchProductUsecase: useCase)
            
            NavigationStack {
                ProductListView(vm: viewModel)
                    .navigationDestination(for: ProductRoute.self) { route in
                        switch route {
                            case .product(let product):
                                ProductDetailView(product: product)
                        case .checkout:
                            CheckoutView()
                        }
                    }
            }
        }
    }
}
