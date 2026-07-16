import Foundation

struct OAuthTokens: Codable {
    let accessToken: String
    let refreshToken: String
    let idToken: String
    let expiryDate: Date
    let tokenType: String
}
