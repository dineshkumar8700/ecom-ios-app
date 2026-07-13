import Foundation
import Combine

final class LoginViewModel: ObservableObject {

    private let loginUseCase: LoginWithGoogleUseCase
    private let exchangeCodeUseCase: ExchangeAuthorizationCodeUseCase

    init(loginUseCase: LoginWithGoogleUseCase, exchangeCodeUseCase: ExchangeAuthorizationCodeUseCase) {
        self.loginUseCase = loginUseCase
        self.exchangeCodeUseCase = exchangeCodeUseCase
    }

    func loginWithGoogle() async {
        do {
            let grant = try await loginUseCase.execute()
            let token = try await exchangeCodeUseCase.execute(authorizationGrant: grant)
            print(token)
        }
        catch {
            print(error.localizedDescription)
        }
        
    }
}
