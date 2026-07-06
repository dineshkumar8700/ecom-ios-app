import Foundation

final class CoordinatorSceneFactory {

    private let appContainer: AppContainer

    init(appContainer: AppContainer) {
        self.appContainer = appContainer
    }
    
    func makeMainTabView() -> MainTabView {
        return MainTabView(
            coordinatSceneFactory: self
        )
    }
    
    func makeHomeCoordinatorView() -> HomeCoordinatorView {
        let homeSceneFactory = HomeSceneFactory(appContainer: appContainer)
        
        return HomeCoordinatorView(
            homeView: homeSceneFactory.makeHomeView()
        )
    }
    
}
