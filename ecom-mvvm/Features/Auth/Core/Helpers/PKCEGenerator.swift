import Foundation
import CryptoKit

struct PKCEGenerator {

    static func generate() -> PKCE {

        let verifier = generateVerifier()
        let challenge = challenge(for: verifier)

        return PKCE(
            codeVerifier: verifier,
            codeChallenge: challenge
        )
    }
    
    private static func generateVerifier(length: Int = 64) -> String {

        let characters = Array(
            "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-._~"
        )

        return String(
            (0..<length).compactMap { _ in
                characters.randomElement()
            }
        )
    }
    
    private static func challenge(for verifier: String) -> String {

        let hash = SHA256.hash(data: Data(verifier.utf8))

        return base64URLEncode(Data(hash))
    }
    
    private static func base64URLEncode(_ data: Data) -> String {

        return data.base64EncodedString()
            .replacingOccurrences(of: "+", with: "-")
            .replacingOccurrences(of: "/", with: "_")
            .replacingOccurrences(of: "=", with: "")
    }

}
