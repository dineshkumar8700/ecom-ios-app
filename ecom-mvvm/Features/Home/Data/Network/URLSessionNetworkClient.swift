//
//  URLSessionNetworkClient.swift
//  ecom-mvvm
//
//  Created by Dinesh Kumar on 27/06/26.
//

import Foundation

class URLSessionNetworkClient: NetworkClient {
    
    func request<T: Decodable>(_ request: URLRequest) async throws -> T {
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw APIError.invalidResponse
        }
        
        guard 200...299 ~= httpResponse.statusCode else {
            throw APIError.serverError
        }
        
        return try JSONDecoder().decode(T.self, from: data)
    }
}
