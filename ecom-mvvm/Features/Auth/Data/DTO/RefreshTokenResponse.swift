import Foundation

struct RefreshTokenResponse: Decodable {
    let access_token: String
    let expires_in: Int
    let token_type: String
    let scope: String
    let id_token: String
}
