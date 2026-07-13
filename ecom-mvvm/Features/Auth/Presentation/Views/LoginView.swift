import Foundation
import SwiftUI

struct LoginView: View {

    @ObservedObject var viewModel: LoginViewModel

    var body: some View {
        VStack(spacing: 24) {

            Text("Welcome")

            Button("Continue with Google") {
                Task {
                    await viewModel.loginWithGoogle()
                }
                
            }
        }
    }
}
