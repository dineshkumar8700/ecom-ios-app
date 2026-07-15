import Foundation

enum DecoderError: Error {
    case invalidBase64
    case invalidJWT
}

struct GoogleIDTokenDecoder {

    func decode(idToken: String) throws -> UserProfile {
    
        let parts = idToken.split(separator: ".")
        guard parts.count == 3 else {
            throw DecoderError.invalidJWT
        }

        let payload = String(parts[1])
        let data = try decodeBase64URL(payload)

        let profile = try JSONDecoder().decode(
            UserProfile.self,
            from: data
        )

        return profile
    }

    private func decodeBase64URL(_ value: String) throws -> Data {

        var base64 = value
            .replacingOccurrences(of: "-", with: "+")
            .replacingOccurrences(of: "_", with: "/")

        while base64.count % 4 != 0 {
            base64 += "="
        }

        guard let data = Data(base64Encoded: base64) else {
            throw DecoderError.invalidBase64
        }

        return data
    }
}
