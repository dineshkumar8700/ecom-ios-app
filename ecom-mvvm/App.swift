import SwiftUI
import Resolver

@main
struct ecom_mvvmApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    @StateObject
    var sessionManager: SessionManager = Resolver.resolve()
       
    let coordinatorSceneFactory = CoordinatorSceneFactory()
        
    var body: some Scene {
        WindowGroup {
            coordinatorSceneFactory
                .makeMainTabView()
                .environmentObject(sessionManager)
                .task {
                    do {
                        _ = try sessionManager.restoreSession()
                    } catch {
                        print(error.localizedDescription)
                    }
                }
        }
    }
}
