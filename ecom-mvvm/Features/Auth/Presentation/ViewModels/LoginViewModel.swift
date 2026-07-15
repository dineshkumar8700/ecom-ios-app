import Foundation
import Combine

final class LoginViewModel: ObservableObject {

    private let loginUseCase: LoginWithGoogleUseCase
    private let exchangeCodeUseCase: ExchangeAuthorizationCodeUseCase
    private let getProfileUseCase: GetProfileUseCase

    init(loginUseCase: LoginWithGoogleUseCase, exchangeCodeUseCase: ExchangeAuthorizationCodeUseCase, getProfileUseCase: GetProfileUseCase) {
        self.loginUseCase = loginUseCase
        self.exchangeCodeUseCase = exchangeCodeUseCase
        self.getProfileUseCase = getProfileUseCase
    }

    func loginWithGoogle() async {
        do {
            let grant = try await loginUseCase.execute()
            let token = try await exchangeCodeUseCase.execute(authorizationGrant: grant)
            let profile = try await getProfileUseCase.execute(accessToken: token.accessToken)
            
            print("User Profile: \n \(profile)")
        }
        catch {
            print(error.localizedDescription)
        }
        
    }
}
