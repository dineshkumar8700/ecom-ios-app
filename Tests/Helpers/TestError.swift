//
//  TestError.swift
//  ecom-mvvm
//
//  Created by Dinesh Kumar on 30/06/26.
//

import Foundation

enum TestError: LocalizedError {
    case network

    var errorDescription: String? {
        "Network Error"
    }
}
