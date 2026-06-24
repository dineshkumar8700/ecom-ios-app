//
//  Product.swift
//  ecom-mvvm
//
//  Created by Dinesh Kumar on 24/06/26.
//

import Foundation

struct Product: Identifiable, Decodable {
    var id: Int
    var title: String
    var price: Double
    var image: String
}
