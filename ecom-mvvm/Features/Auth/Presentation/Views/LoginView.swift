import Foundation
import SwiftUI

struct LoggedInView: View {
    let user: UserProfile
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Hello")
            HStack {
                AsyncImage(url: URL(string: user.picture)) { image in
                    image
                        .resizable()
                        .frame(width: 50, height: 50)
                        .cornerRadius(10)
                } placeholder: {
                    ProgressView()
                }
                    
                Text("\(user.name)")
                    .fontWeight(.bold)
            }
  
            Spacer()
        }
        .padding()
        
    }
}

struct LoggedOutView: View {
    let vm: LoginViewModel
    
    var body: some View {
        VStack {
            Text("Welcome Back!")
            
            Button {
                Task {
                    await vm.loginWithGoogle()
                }
            } label: {
                HStack {
                    Text("Login with Google")
                    Image("google_logo")
                        .resizable()
                        .frame(width: 20, height: 20)
                }
                .padding(10)
                .background(.black)
                .foregroundStyle(.white)
                .cornerRadius(5)
            }
        }
    }
}

struct LoginView: View {

    @ObservedObject var vm: LoginViewModel
    @EnvironmentObject var session: SessionManager

    var body: some View {
        VStack(spacing: 24) {
            
            if vm.isLoading {
                ProgressView()
            }  else if let user = session.currentUser {
                LoggedInView(user: user)
            }   else {
                LoggedOutView(vm: vm)
            }
            
        }
        .task {
            await vm.load()
        }
    }
}
