//
//  APIError.swift
//  ecom-mvvm
//
//  Created by Dinesh Kumar on 27/06/26.
//

import Foundation

enum APIError: Error {
    case invalidResponse
    case serverError(Int)
    case decodingError
}
