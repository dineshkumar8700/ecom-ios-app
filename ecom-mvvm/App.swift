import SwiftUI
import FirebaseCore

@main
struct ecom_mvvmApp: App {
    
    let coordinatorSceneFactory = CoordinatorSceneFactory()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            coordinatorSceneFactory
                .makeMainTabView()
        }
    }
}
