import Foundation

struct AuthorizationURLBuilder {

    static func build(
        state: String,
        pkce: PKCE
    ) -> URL? {

        var components = URLComponents(
            url: GoogleOAuthConfiguration.authorizationEndpoint,
            resolvingAgainstBaseURL: false
        )

        components?.queryItems = [

            URLQueryItem(
                name: "client_id",
                value: GoogleOAuthConfiguration.clientID
            ),

            URLQueryItem(
                name: "redirect_uri",
                value: GoogleOAuthConfiguration.redirectURI
            ),

            URLQueryItem(
                name: "response_type",
                value: GoogleOAuthConfiguration.responseType
            ),

            URLQueryItem(
                name: "scope",
                value: GoogleOAuthConfiguration.scopes
            ),

            URLQueryItem(
                name: "state",
                value: state
            ),

            URLQueryItem(
                name: "code_challenge",
                value: pkce.codeChallenge
            ),

            URLQueryItem(
                name: "code_challenge_method",
                value: GoogleOAuthConfiguration.codeChallengeMethod
            )
        ]

        return components?.url
    }
}
