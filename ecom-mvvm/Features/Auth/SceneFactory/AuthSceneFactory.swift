import Foundation
import Resolver

final class AuthSceneFactory {
    func makeLoginView() -> LoginView {
        let vm = LoginViewModel(loginUseCase: Resolver.resolve())
        
        return LoginView(viewModel: vm)
    }
}
