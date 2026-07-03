//
//  NimbleSampleTest.swift
//  ecom-mvvmTests
//
//  Created by Dinesh Kumar on 03/07/26.
//

import Foundation
import Nimble
import XCTest
@testable import ecom_mvvm

final class NimbleSampleTest: XCTestCase {
    func testSimpleAssertion() {
        expect(5).to(equal(5))
        expect(4).toNot(equal(5))
        expect([1,2,3]).to(contain([2, 3]))
        expect([2,3]).toNot(contain(5))
    }
    
    func testFetchProducts() {
        let url = URL(string: "https://fakestoreapi.com/products")!

        waitUntil(timeout: .seconds(5)) { done in

            URLSession.shared.dataTask(with: url) { data, response, error in

                expect(error).to(beNil())
                expect(data).toNot(beNil())

                do {
                    let products = try JSONDecoder().decode([Product].self, from: data!)

                    expect(products).toNot(beEmpty())
                    expect(products.first?.title).toNot(beNil())

                } catch {
                    fail("Decoding failed: \(error)")
                }

                done()
            }.resume()
        }
    }
    
}
