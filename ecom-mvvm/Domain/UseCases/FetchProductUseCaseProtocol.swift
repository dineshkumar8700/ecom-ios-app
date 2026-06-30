//
//  FetchProductUseCaseProtocol.swift
//  ecom-mvvm
//
//  Created by Dinesh Kumar on 30/06/26.
//

import Foundation

protocol FetchProductUseCaseProtocol {
    func execute() async throws -> [Product]
}
