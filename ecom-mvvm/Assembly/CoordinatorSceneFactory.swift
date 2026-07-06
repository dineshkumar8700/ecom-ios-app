import Foundation

final class CoordinatorSceneFactory {

    private let appContainer: AppContainer

    init(appContainer: AppContainer) {
        self.appContainer = appContainer
    }
    
    func makeMainTabView() -> MainTabView {

        let homeSceneFactory = HomeSceneFactory(appContainer: appContainer)

        return MainTabView(
            homeView: homeSceneFactory.makeHomeView()
        )
    }
    
}
