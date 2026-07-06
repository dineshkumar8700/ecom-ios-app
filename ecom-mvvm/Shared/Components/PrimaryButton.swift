import Foundation
import SwiftUI

struct PrimaryButton: View {
    let label: String
    let buttonAction: () -> Void
    
    var body: some View {
        Button(label) {
            buttonAction()
        }
        .padding(4)
        .background(.blue)
        .foregroundStyle(.white)
        .cornerRadius(10)
    }
}
