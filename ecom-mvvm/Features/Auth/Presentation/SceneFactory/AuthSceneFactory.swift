import Foundation
import Resolver

final class AuthSceneFactory {
    func makeLoginView() -> LoginView {
        let vm = LoginViewModel(
            loginUseCase: Resolver.resolve(),
            exchangeCodeUseCase: Resolver.resolve(),
            getProfileUseCase: Resolver.resolve()
        )
        
        return LoginView(viewModel: vm)
    }
}
