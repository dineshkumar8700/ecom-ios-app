import SwiftUI
import FirebaseCore

@main
struct ecom_mvvmApp: App {
    
    init() {
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            CoordinatorSceneFactory()
                .makeMainTabView()
        }
    }
}
