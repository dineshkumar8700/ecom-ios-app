import Foundation

protocol KeychainStoreProtocol {
    func save<T: Codable>(_ value: T, for key: String) throws
    
    func load<T: Codable>(_ type: T.Type, for key: String) throws -> T?
    
    func delete(for key: String) throws
}
