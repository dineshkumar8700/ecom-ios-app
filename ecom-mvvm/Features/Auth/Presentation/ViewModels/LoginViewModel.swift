import Foundation
import SwiftUI
import Combine
import Resolver

final class LoginViewModel: ObservableObject {

    private let loginUseCase: LoginWithGoogleUseCase
    private let exchangeCodeUseCase: ExchangeAuthorizationCodeUseCase
    private let getProfileUseCase: GetProfileUseCase
    @ObservedObject private var sessionManager: SessionManager

    init(loginUseCase: LoginWithGoogleUseCase, exchangeCodeUseCase: ExchangeAuthorizationCodeUseCase, getProfileUseCase: GetProfileUseCase, sessionManager: SessionManager) {
        self.loginUseCase = loginUseCase
        self.exchangeCodeUseCase = exchangeCodeUseCase
        self.getProfileUseCase = getProfileUseCase
        self.sessionManager = sessionManager
    }

    func loginWithGoogle() async {
        do {
            let grant = try await loginUseCase.execute()
            let token = try await exchangeCodeUseCase.execute(authorizationGrant: grant)
            let profile = try GoogleIDTokenDecoder().decode(idToken: token.idToken)
            
            try sessionManager.saveSession(tokens: token, user: profile)
            
        }
        catch {
            print(error.localizedDescription)
        }
    }
    
    func load() async {
        do {
            let accessToken = try sessionManager.getAccessToken()
            let profile = try await getProfileUseCase.execute(accessToken: accessToken)
            sessionManager.setUser(profile)
        } catch {
            print(error.localizedDescription)
        }
    }
}
