import XCTest
@testable import ecom_mvvm

@MainActor
final class ProductListViewModelTests: XCTestCase {
    var mockUseCase: MockFetchProductUseCase!
    var sut: ProductListViewModel!
    
    override func setUp() {
        super.setUp()
        
        mockUseCase = MockFetchProductUseCase()
        sut = ProductListViewModel(fetchProductUsecase: mockUseCase)
    }
    
    override func tearDown() {
        mockUseCase = nil
        sut = nil
        
        super.tearDown()
    }
    
    func testInitialState() {
        XCTAssertTrue(sut.state.products.isEmpty)
        XCTAssertFalse(sut.state.isLoading)
        XCTAssertNil(sut.state.error)
        
    }
    
    func testOnAppearLoadsProducts() async {
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
        
        await sut.send(action: .onAppear)
        
        XCTAssertEqual(sut.state.products.count, 1)
        XCTAssertEqual(sut.state.products.first?.title, "iphone")
    }
    
    func testOnAppearShouldNotFetchAgainWhenProductsAreAlreadyLoaded() async {
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
        
        await sut.send(action: .onAppear)
        await sut.send(action: .onAppear)
        
        XCTAssertEqual(mockUseCase.executeCallCounts, 1)
    }
    
    func testOnAppearFetchFailureSetsError() async {
        mockUseCase.result = .failure(TestError.network)
        
        await sut.send(action: .onAppear)
        
        XCTAssertTrue(sut.state.products.isEmpty)
        XCTAssertEqual(sut.state.error, "Network Error")
        XCTAssertFalse(sut.state.isLoading)
    }
    
    func testOnRefreshShouldAlwaysFetchFreshData() async {
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
        
        await sut.send(action: .onRefresh)
        await sut.send(action: .onRefresh)
        
        XCTAssertEqual(mockUseCase.executeCallCounts, 2)
    }

}
