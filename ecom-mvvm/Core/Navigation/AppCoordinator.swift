//
//  AppCoordinator.swift
//  ecom-mvvm
//
//  Created by Dinesh Kumar on 01/07/26.
//

import Foundation
import SwiftUI
import Combine

final class AppCoordinator: Coordinator {
    @Published var path = NavigationPath()
    
    func showProduct(product: Product) {
        path.append(AppRoute.productDetail(product: product))
    }
    
    func showCheckout() {
        path.append(AppRoute.checkout)
    }
    
    func goBack() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
}
