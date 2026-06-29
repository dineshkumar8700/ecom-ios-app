import Foundation
import SwiftUI

struct LoginView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    
    var body: some View {
        
        VStack {
            Text("login.title")
            TextField("login.username.placeholder", text: $username)
                .textFieldStyle(.roundedBorder)
            SecureField("login.password.placeholder", text: .constant(""))
                .textFieldStyle(.roundedBorder)
                
            Button("login.button") {
                print("user logged in")
            }
            .padding(8)
            .background(.blue)
            .foregroundStyle(.white)
            .cornerRadius(8)
            
        }.padding(10)
    }
}

#Preview {
    LoginView()
        .environment(\.locale, Locale(identifier: "fr"))

}
