import Foundation

struct DeepLinkParser {
    func parse(url: URL) -> DeepLink? {
        guard url.scheme == "myecom" else {
            return nil
        }
        
        let components = url.pathComponents
        
        switch url.host {
            
        case "product":
            guard
                let idString = components.last,
                let id = Int(idString)
            else { return nil }
            return .product(id: id)
        
        case "wishlist":
            return .wishlist
            
        default :
            return nil
            
        }

    }
}
