import Foundation

enum GoogleOAuthConfiguration {

    static let authorizationEndpoint =
        URL(string: "https://accounts.google.com/o/oauth2/v2/auth")!

    static let redirectURI = "com.tw.step.ecom-mvvm:/oauth2redirect"

    static let scopes = "openid email profile"

    static let codeChallengeMethod = "S256"

    static let responseType = "code"

    static let clientID = ProcessInfo.processInfo.environment["CLIENT_ID"]
        
}
