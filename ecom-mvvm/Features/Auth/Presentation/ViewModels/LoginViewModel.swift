import Foundation
import SwiftUI
import Combine
import Resolver

final class LoginViewModel: ObservableObject {
    @Published var isLoading: Bool = false
    
    private let loginUseCase: LoginWithGoogleUseCase
    private let exchangeCodeUseCase: ExchangeAuthorizationCodeUseCase
    private let authorizedClient: AuthorizedNetworkClient
    @ObservedObject private var sessionManager: SessionManager

    init(loginUseCase: LoginWithGoogleUseCase, exchangeCodeUseCase: ExchangeAuthorizationCodeUseCase, authorizedClient: AuthorizedNetworkClient, sessionManager: SessionManager) {
        self.loginUseCase = loginUseCase
        self.exchangeCodeUseCase = exchangeCodeUseCase
        self.sessionManager = sessionManager
        self.authorizedClient = authorizedClient
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
        self.isLoading = true
        
        defer {
            self.isLoading = false
        }
        
        do {
            let profile = try await authorizedClient.loadUserProfile()
            sessionManager.setUser(profile)
        } catch {
            print("User is logged out")
            try? sessionManager.logout()
        }
    }
}
