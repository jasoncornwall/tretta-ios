//
//  SignInScreen.swift
//  Tretta
//
//  Created by Jason C on 4/9/23.
//

import SwiftUI

struct SignInScreen: View {
    @EnvironmentObject private var navigationState: NavigationState
    
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
                    .padding(.horizontal, 56)
                    .onChange(of: emailText) { newValue in
                        print("New Email Value: \(newValue)")
                    }
                Spacer()
                    .frame(height: 48)
                FloatingTextField(title: "PASSWORD", text: $passwordText)
                    .padding(.horizontal, 56)
                    .onChange(of: passwordText) { newValue in
                        print("New Password Value: \(newValue)")
                    }
                Spacer()
                    .frame(height: 48)
                Button("SIGN IN") {
                    navigationState.routes.append(.rootMain)
                }
                .buttonStyle(PillButton())
                Button("Forgot password?") {
                    print("Forgot Pswd tapped.")
                }
                .buttonStyle(ClearButton())
            }
            Spacer()
            Button("New here? Register instead.") {
                print("Register tapped.")
                navigationState.routes.append(.onboarding(.signUpName))
            }
            .buttonStyle(ClearButton())
        }
        .background(Color.backgroundBlue)
    }
}

struct SignInScreen_Previews: PreviewProvider {
    static var previews: some View {
        SignInScreen()
    }
}
