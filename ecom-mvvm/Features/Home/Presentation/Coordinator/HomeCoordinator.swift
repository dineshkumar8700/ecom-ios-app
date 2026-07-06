import Foundation
import SwiftUI
import Combine

final class HomeCoordinator: Coordinator {
    @Published var path = NavigationPath()
    @Published var sheet: SheetRoute?
    
    func push(_ route : HomeRoute) {
        path.append(route)
    }
    
    func pop() {
        path.removeLast()
    }
    
    func present(_ sheet: SheetRoute) {
        self.sheet = sheet
    }
    
    func dismiss() {
        self.sheet = nil
    }
    
}
