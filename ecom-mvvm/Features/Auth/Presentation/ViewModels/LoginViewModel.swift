import Foundation
import Combine

final class LoginViewModel: ObservableObject {

    private let loginUseCase: LoginWithGoogleUseCase

    init(loginUseCase: LoginWithGoogleUseCase) {
        self.loginUseCase = loginUseCase
    }

    func loginWithGoogle() async {
        do {
            let grant = try await loginUseCase.execute()
            print("AUTH CODE: \(grant.authorizationCode)")
        }
        catch {
            print(error.localizedDescription)
        }
        
    }
}
