import SwiftUI

@main
struct ecom_mvvmApp: App {
    
    let coordinatorSceneFactory = CoordinatorSceneFactory()
    
    var body: some Scene {
        WindowGroup {
            coordinatorSceneFactory
                .makeMainTabView()
        }
    }
}
