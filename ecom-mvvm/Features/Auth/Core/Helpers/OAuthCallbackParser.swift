import Foundation

struct OAuthCallbackParser {

    static func parse( url: URL) throws -> OAuthCallback {

        guard
            let components = URLComponents(
                url: url,
                resolvingAgainstBaseURL: false
            )
        else {
            throw AuthenticationError.invalidCallback
        }

        let items = components.queryItems ?? []

        guard
            let code = items.first(where: { $0.name == "code" })?.value,
            let state = items.first(where: { $0.name == "state" })?.value
        else {
            throw AuthenticationError.invalidCallback
        }

        return OAuthCallback(
            code: code,
            state: state
        )
    }
}
