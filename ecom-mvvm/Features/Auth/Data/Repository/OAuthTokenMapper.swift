import Foundation

enum OAuthTokenMapper {

    static func toDomain(_ response: OAuthTokenResponse) -> OAuthTokens {

        OAuthTokens(
            accessToken: response.access_token,
            refreshToken: response.refresh_token,
            idToken: response.id_token,
            expiryDate: Date().addingTimeInterval(Double(response.expires_in)),
            tokenType: response.token_type
        )
    }

}
