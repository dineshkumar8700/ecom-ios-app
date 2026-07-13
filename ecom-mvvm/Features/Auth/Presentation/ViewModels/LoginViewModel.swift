import Foundation
import Combine

final class LoginViewModel: ObservableObject {

    private let loginUseCase: LoginWithGoogleUseCase

    init(loginUseCase: LoginWithGoogleUseCase) {
        self.loginUseCase = loginUseCase
    }

    func loginWithGoogle() {
        loginUseCase.execute()
    }
}
