import Foundation
import Combine

@MainActor
final class WishlistStore: ObservableObject {

    @Published private(set) var products: [Product] = []

    func setProducts(_ products: [Product]) {
        self.products = products
    }

    func add(_ product: Product) {
        guard !contains(product) else { return }
        products.insert(product, at: 0)
    }

    func remove(_ product: Product) {
        products.removeAll { $0.id == product.id }
    }

    func toggle(_ product: Product) {
        contains(product)
        ? remove(product)
        : add(product)
    }

    func contains(_ product: Product) -> Bool {
        products.contains { $0.id == product.id }
    }
}
