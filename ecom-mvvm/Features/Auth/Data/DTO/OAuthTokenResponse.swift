import Foundation

struct OAuthTokenResponse: Decodable {

    let access_token: String

    let refresh_token: String?

    let id_token: String

    let expires_in: Int

    let token_type: String

}
