import Foundation

struct StateGenerator {

    static func generate(length: Int = 32) -> String {
        let characters = Array("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789")

        return String(
            (0..<length).compactMap { _ in
                characters.randomElement()
            }
        )
    }
}
