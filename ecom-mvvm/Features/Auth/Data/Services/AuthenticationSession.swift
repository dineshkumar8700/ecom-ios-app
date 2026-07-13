import Foundation
import AuthenticationServices
import UIKit

final class AuthenticationSession: NSObject, AuthenticationSessionProtocol {

    private var session: ASWebAuthenticationSession?

    func start(
        url: URL,
        callbackScheme: String
    ) async throws -> URL {

        try await withCheckedThrowingContinuation { continuation in

            session = ASWebAuthenticationSession(
                url: url,
                callbackURLScheme: callbackScheme
            ) { callbackURL, error in

                if let error {
                    continuation.resume(throwing: error)
                    return
                }

                guard let callbackURL else {
                    continuation.resume(
                        throwing: AuthenticationError.invalidCallback
                    )
                    return
                }

                continuation.resume(returning: callbackURL)
            }

            session?.presentationContextProvider = self
            session?.prefersEphemeralWebBrowserSession = false
            session?.start()
        }
    }}

extension AuthenticationSession: ASWebAuthenticationPresentationContextProviding {

    func presentationAnchor(
        for session: ASWebAuthenticationSession
    ) -> ASPresentationAnchor {

        guard
            let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
            let window = scene.windows.first
        else {
            return ASPresentationAnchor()
        }

        return window
    }
}
