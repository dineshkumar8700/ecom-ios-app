import XCTest
@testable import ecom_mvvm

final class AsyncUnitTestExample: XCTestCase {
    func testFetchPostList() {
        let exp = expectation(description:"fetching post list from server")
        let session: URLSession = URLSession(configuration: .default)
        let url = URL(string: "https://fakestoreapi.com/products")!
            
        session.dataTask(with: url) { data, response, error in
            XCTAssertNotNil(data)
            exp.fulfill()
        }.resume()
        
//        waitForExpectations(timeout: 5.0) { error in
//            print(error?.localizedDescription ?? "error")
//        }
        
        wait(for: [exp], timeout: 5.0)
    }
}
