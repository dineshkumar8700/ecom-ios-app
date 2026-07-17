import Foundation
import Security

enum KeychainError: Error {
    case updateFailed(_ updateStatus: OSStatus)
    case saveFailed(_ saveStatus: OSStatus)
    case loadFailed(_ saveStatus: OSStatus)
    case deleteFailed(_ saveStatus: OSStatus)
    case invalidData
}

final class KeychainStore: KeychainStoreProtocol {
    func load<T: Codable>(_ type: T.Type, for key: String) throws -> T? {
        let query: [CFString: Any] = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: key,
            kSecReturnData: true,
            kSecMatchLimit: kSecMatchLimitOne
        ]
        
        var item: CFTypeRef?
        
        let status = SecItemCopyMatching(query as CFDictionary, &item)
        
        switch status {
        
        case errSecSuccess:
            guard let data = item as? Data else {
                throw KeychainError.invalidData
            }
            
            return try JSONDecoder().decode(T.self, from: data)
            
        case errSecItemNotFound:
            return nil
            
        default:
            throw KeychainError.loadFailed(status)
            
        }
    }

    func delete(for key: String) throws {
        let query: [CFString: Any] = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: key
        ]
        
        let status = SecItemDelete(query as CFDictionary)
        
        switch status {
        
        case errSecSuccess, errSecItemNotFound:
            return
            
        default:
            throw KeychainError.deleteFailed(status)
        }
        
    }

    func save<T: Codable>(_ value: T, for key: String) throws {
        
        let data = try JSONEncoder().encode(value)
        
        let query: [CFString: Any] = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: key,
            kSecValueData: data
        ]
        
        let status = SecItemAdd(query as CFDictionary, nil)
        
        switch status {
            
        case errSecSuccess:
            return
            
        case errSecDuplicateItem:
            let searchQuery: [CFString: Any] = [
                kSecClass: kSecClassGenericPassword,
                kSecAttrAccount: key
            ]
            
            let updateQuery: [CFString: Any] = [
                kSecValueData: data
            ]
            
            let updateStatus = SecItemUpdate(
                searchQuery as CFDictionary,
                updateQuery as CFDictionary
            )
            
            guard updateStatus == errSecSuccess else {
                throw KeychainError.updateFailed(updateStatus)
            }
            
        default :
            throw KeychainError.saveFailed(status)
            
        }
        
    }
    
}
