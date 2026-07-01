import XCTest
@testable import ecom_mvvm

@MainActor
final class FetchProductUseCaseTests: XCTestCase {
    var mockRepository: MockProductRepository!
    var sut : FetchProductUseCase!
    
    override func setUp() {
        super.setUp()
        
        mockRepository = MockProductRepository()
        sut = FetchProductUseCase(repository: mockRepository)
    }
    
    override func tearDown() {
        mockRepository = nil
        sut = nil
        
        super.tearDown()
    }
    
    func testExecuteShouldReturnProductList() async throws {
        let products = [
            Product(
                id: 1,
                title: "iphone",
                price: 500,
                image: "iphone.png",
                rating: Rating(rate: 4.1, count: 23)
            )
        ]
        
        mockRepository.result = .success(products)

        let result = try await sut.execute()

        XCTAssertEqual(result.count, 1)
        XCTAssertEqual(result.first?.id, 1)
        XCTAssertEqual(result.first?.title, "iphone")
    }
    
    func testExecuteThrowError() async throws {
        mockRepository.result = .failure(TestError.network)
        
        do {
            _ = try await sut.execute()
            XCTFail("Expected an error")
            
        } catch {
            XCTAssertTrue(error is TestError)
        }
    
    }
}
