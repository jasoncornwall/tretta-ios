//
//  SignInScreen.swift
//  Tretta
//
//  Created by Jason C on 4/9/23.
//

import SwiftUI

struct SignInScreen: View {
    
    @Binding var route: Route
    @State private var emailText = ""
    @State private var passwordText = ""
    
    var body: some View {
        VStack {
            Spacer()
            Text("Tretta CRM")
                .font(.system(size: 40, weight: .bold))
                .foregroundColor(.trettaGold)
            Spacer()
                .frame(height: 80)
            Group {
                FloatingTextField(title: "EMAIL", text: $emailText)
                    .padding(.horizontal, 40)
                    .onChange(of: emailText) { newValue in
                        print("New Email Value: \(newValue)")
                    }
                Spacer()
                    .frame(height: 48)
                FloatingTextField(title: "PASSWORD", text: $passwordText)
                    .padding(.horizontal, 40)
                    .onChange(of: passwordText) { newValue in
                        print("New Password Value: \(newValue)")
                    }
                Spacer()
                    .frame(height: 48)
                Button("SIGN IN") {
                    AuthService.login(email: emailText, password: passwordText) { result in
                        switch result {
                        case let .success(response):
                            // Save access token to keychain here
                            print("Access Token: \(response.accessToken)")
                        case let .failure(error):
                            print("Login Error: \(error)")
                        }
                    }
                    withAnimation {
//                        route = .rootMain(0)
                    }
                }
                .buttonStyle(PillButton())
                Button("Forgot password?") {
                    print("Forgot Pswd tapped.")
                    withAnimation {
                        route = .onboarding(.resetPassword)
                    }
                }
                .buttonStyle(ClearButton())
            }
            Spacer()
            Button("New here? Register instead.") {
                let user = CreateUserDTO(
                    email: "",
                    password: "",
                    firstName: "Test",
                    lastName: "User"
                )
                UserService.createUser(user: user) { result in
                    switch result {
                    case let .success(user):
                        print("Created User: \(user)")
                    case let .failure(error):
                        print("Create User Error: \(error)")
                    }
                }
                withAnimation {
//                    route = .onboarding(.addCompany)
                }
            }
            .buttonStyle(ClearButton())
            .padding(.bottom, 16)
        }
        .background(Color.backgroundBlue)
    }
}

//struct SignInScreen_Previews: PreviewProvider {
//    @State private static var initialRoute: Route = .onboarding(.signIn)
//    static var previews: some View {
//        SignInScreen(route: $initialRoute)
//    }
//}
