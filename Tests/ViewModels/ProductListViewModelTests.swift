import XCTest
@testable import ecom_mvvm

@MainActor
final class ProductListViewModelTests: XCTestCase {
    func testInitialState() {
        
        // Arrange
        let mockUseCase = MockFetchProductUseCase()
        let sut = ProductListViewModel(fetchProductUsecase: mockUseCase)
        
        // Assert
        XCTAssertTrue(sut.state.products.isEmpty)
        XCTAssertFalse(sut.state.isLoading)
        XCTAssertNil(sut.state.error)
        
    }
    
    func testOnAppearLoadsProducts() async {
        // Arrange
        let mockUseCase = MockFetchProductUseCase()
        
        let products = [
            Product(
                id: 1,
                title: "iphone",
                price: 500,
                image: "iphone.png",
                rating: Rating(rate: 4.1, count: 23)
            )
        ]
        
        mockUseCase.result = .success(products)
        
        let sut = ProductListViewModel(fetchProductUsecase: mockUseCase)
        
        // Act
        await sut.send(action: .onAppear)
        
        // Assert
        XCTAssertEqual(sut.state.products.count, 1)
        XCTAssertEqual(sut.state.products.first?.title, "iphone")
    }
    
    func testOnAppearShouldNotFetchAgainWhenProductsAreAlreadyLoaded() async {
        let mockUseCase = MockFetchProductUseCase()
        let products = [
            Product(
                id: 1,
                title: "iphone",
                price: 500,
                image: "iphone.png",
                rating: Rating(rate: 4.1, count: 23)
            )
        ]
        
        mockUseCase.result = .success(products)
        
        let sut = ProductListViewModel(fetchProductUsecase: mockUseCase)
        
        await sut.send(action: .onAppear)
        await sut.send(action: .onAppear)
        
        XCTAssertEqual(mockUseCase.executeCallCounts, 1)
    }
    
    func testOnAppearFetchFailureSetsError() async {
        let mockUseCase = MockFetchProductUseCase()
        mockUseCase.result = .failure(TestError.network)
        
        let sut = ProductListViewModel(fetchProductUsecase: mockUseCase)
        
        await sut.send(action: .onAppear)
        
        XCTAssertTrue(sut.state.products.isEmpty)
        XCTAssertEqual(sut.state.error, "Network Error")
        XCTAssertFalse(sut.state.isLoading)
    }
    
    func testOnRefreshShouldAlwaysFetchFreshData() async {
        let mockUseCase = MockFetchProductUseCase()
        let products = [
            Product(
                id: 1,
                title: "iphone",
                price: 500,
                image: "iphone.png",
                rating: Rating(rate: 4.1, count: 23)
            )
        ]
        
        mockUseCase.result = .success(products)
        
        let sut = ProductListViewModel(fetchProductUsecase: mockUseCase)
        
        await sut.send(action: .onRefresh)
        await sut.send(action: .onRefresh)
        
        XCTAssertEqual(mockUseCase.executeCallCounts, 2)
    }

}
