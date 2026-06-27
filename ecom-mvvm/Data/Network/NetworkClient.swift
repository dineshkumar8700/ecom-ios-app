//
//  Network.swift
//  ecom-mvvm
//
//  Created by Dinesh Kumar on 27/06/26.
//

import Foundation

protocol NetworkClient {
    func request<T: Decodable>(_ request: URLRequest) async throws -> T
}
