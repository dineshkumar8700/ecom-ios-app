import Foundation

protocol NetworkClient {
    func request<T: Decodable>(_ request: URLRequest) async throws -> T
}
