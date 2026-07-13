import Foundation

struct OAuthToken {

    let accessToken: String

    let refreshToken: String?

    let idToken: String

    let expiresIn: Int

    let tokenType: String

}
