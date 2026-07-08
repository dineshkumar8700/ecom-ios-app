import SwiftUI
import FirebaseCore

@main
struct ecom_mvvmApp: App {

    private let appContainer = AppContainer()
    
    init() {
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            CoordinatorSceneFactory(appContainer: appContainer)
                .makeMainTabView()
        }
    }
}
