import XCTest

final class FetchProductUseCaseTests: XCTestCase {
    func testExecuteShouldReturnProductList() async {
        // Arrange
        let mockRepository = MockProductRepository()
        let sut = FetchProductUseCase(repository: mockRepository)
        
        let result = try? await sut.execute()
        
        XCTAssertEqual(result?.count, 1)
    }
}
