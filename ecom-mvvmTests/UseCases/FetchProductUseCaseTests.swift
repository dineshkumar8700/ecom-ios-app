import XCTest
@testable import ecom_mvvm

@MainActor
final class FetchProductUseCaseTests: XCTestCase {
    func testExecuteShouldReturnProductList() async throws {
        // Arrange
        let mockRepository = MockProductRepository()
        
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
        let sut = FetchProductUseCase(repository: mockRepository)

        // Act
        let result = try await sut.execute()

        // Assert
        XCTAssertEqual(result.count, 1)
        XCTAssertEqual(result.first?.id, 1)
        XCTAssertEqual(result.first?.title, "iphone")
    }
    
    func testExecuteThrowError() async throws {
        let mockRepository = MockProductRepository()
        mockRepository.result = .failure(TestError.network)
        
        let sut = FetchProductUseCase(repository: mockRepository)
        
        do {
            _ = try await sut.execute()
            XCTFail("Expected an error")
            
        } catch {
            XCTAssertTrue(error is TestError)
        }
        
    }
}
