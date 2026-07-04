import Foundation
import SwiftUI
import Combine

final class HomeCoordinator: Coordinator {
    @Published var path = NavigationPath()
    
    func push(_ route : HomeRoute) {
        path.append(route)
    }
    
    func pop() {
        path.removeLast()
    }
    
}
