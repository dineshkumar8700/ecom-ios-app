import Foundation
@testable import ecom_mvvm

class MockFetchProductUseCase: FetchProductUseCaseProtocol {
    var executeCallCounts = 0;
    var result: Result<[Product], Error> = .success([])
    
    func execute() async throws -> [Product] {
        executeCallCounts += 1
        return try result.get()
    }
}
