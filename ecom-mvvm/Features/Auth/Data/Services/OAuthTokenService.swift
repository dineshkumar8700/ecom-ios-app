import Foundation

final class OAuthTokenService: OAuthTokenServiceProtocol {
    
    private let networkClient: NetworkClient
    
    init(networkClient: NetworkClient) {
        self.networkClient = networkClient
    }

    func exchange(authorizationGrant: AuthorizationGrant) async throws -> OAuthTokenResponse {

        let body = OAuthTokenRequest(
            code: authorizationGrant.authorizationCode,
            client_id: GoogleOAuthConfiguration.clientID!,
            redirect_uri: GoogleOAuthConfiguration.redirectURI,
            grant_type: "authorization_code",
            code_verifier: authorizationGrant.codeVerifier
        )
        
        var request = URLRequest(
            url: GoogleOAuthConfiguration.tokenEndpoint
        )
        request.httpMethod = "POST"
        
        let bodyString = [
            "code=\(body.code)",
            "client_id=\(body.client_id)",
            "redirect_uri=\(body.redirect_uri)",
            "grant_type=\(body.grant_type)",
            "code_verifier=\(body.code_verifier)"
        ]
        .joined(separator: "&")
        
        request.httpBody = bodyString.data(using: .utf8)
        request.setValue(
            "application/x-www-form-urlencoded",
            forHTTPHeaderField: "Content-Type"
        )
        
        let response: OAuthTokenResponse =
            try await networkClient.request(request)

        return response
        
    }

}
