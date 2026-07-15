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
            let profile = try GoogleIDTokenDecoder().decode(idToken: token.idToken)
            
            print(profile)
//            Fetching explicitly
//            let profile = try await getProfileUseCase.execute(accessToken: token.accessToken)
        }
        catch {
            print(error.localizedDescription)
        }
        
    }
}
