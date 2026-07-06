import SwiftUI

@main
struct ecom_mvvmApp: App {

    private let appContainer = AppContainer()

    var body: some Scene {
        WindowGroup {
            CoordinatorSceneFactory(appContainer: appContainer)
                .makeMainTabView()
        }
    }
}
