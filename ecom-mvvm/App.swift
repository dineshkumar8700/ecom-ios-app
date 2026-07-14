import SwiftUI

@main
struct ecom_mvvmApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
       
    let coordinatorSceneFactory = CoordinatorSceneFactory()
        
    var body: some Scene {
        WindowGroup {
            coordinatorSceneFactory
                .makeMainTabView()
        }
    }
}
