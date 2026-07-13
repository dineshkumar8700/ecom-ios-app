import Foundation

enum OAuthTokenMapper {

    static func toDomain(_ response: OAuthTokenResponse) -> OAuthToken {

        OAuthToken(
            accessToken: response.access_token,
            refreshToken: response.refresh_token,
            idToken: response.id_token,
            expiresIn: response.expires_in,
            tokenType: response.token_type
        )
    }

}
