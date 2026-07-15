import Foundation

final class GoogleOAuthService : GoogleOAuthServiceProtocol {
    
    private let authenticationSession: AuthenticationSessionProtocol
    private var currentSession: OAuthSession?

    init(authenticationSession: AuthenticationSessionProtocol) {
        self.authenticationSession = authenticationSession
    }

    func login() async throws -> AuthorizationGrant {

        let session = OAuthSession(
            state: StateGenerator.generate(),
            pkce: PKCEGenerator.generate()
        )

        currentSession = session

        guard let url = AuthorizationURLBuilder.build(
            state: session.state,
            pkce: session.pkce
        ) else {
            throw AuthenticationError.invalidAuthorizationURL
        }

        let callbackURL = try await authenticationSession.start(
            url: url,
            callbackScheme: "myecom"
        )
        
        let callback = try OAuthCallbackParser.parse(
            url: callbackURL
        )
        
        
        return AuthorizationGrant(
            authorizationCode: callback.code,
            codeVerifier: currentSession!.pkce.codeVerifier
        )
        
    }
}
