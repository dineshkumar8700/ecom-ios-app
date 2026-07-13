import Foundation

struct OAuthTokenRequest: Encodable {

    let code: String

    let client_id: String

    let redirect_uri: String

    let grant_type: String

    let code_verifier: String

}
