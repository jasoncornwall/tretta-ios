//
//  CreateAccountScreen.swift
//  Tretta
//
//  Created by Jason C on 10/19/23.
//

import SwiftUI

struct CreateAccountScreen: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @Binding var route: Route
    @State private var firstNameText = ""
    @State private var lastNameText = ""
    @State private var emailText = ""
    @State private var passwordText = ""
    @State private var isChecked = false
    
    var body: some View {
        NavigationStack {
            VStack {
                ScrollView(.vertical, showsIndicators: false) {
                    VStack {
                        Spacer()
                            .frame(height: 24)
                        Group {
                            FloatingTextField(title: "FIRST", text: $firstNameText)
                                .padding(.horizontal, 40)
                                .onChange(of: firstNameText) { newValue in
                                    print("New Password Value: \(newValue)")
                                }
                            Spacer()
                                .frame(height: 48)
                            FloatingTextField(title: "LAST", text: $lastNameText)
                                .padding(.horizontal, 40)
                                .onChange(of: lastNameText) { newValue in
                                    print("New Confirmed Password Value: \(newValue)")
                                }
                            Spacer()
                                .frame(height: 48)
                            FloatingTextField(title: "EMAIL", text: $emailText)
                                .padding(.horizontal, 40)
                                .onChange(of: emailText) { newValue in
                                    print("New Password Value: \(newValue)")
                                }
                            Spacer()
                                .frame(height: 48)
                            FloatingTextField(title: "PASSWORD", text: $passwordText)
                                .padding(.horizontal, 40)
                                .onChange(of: passwordText) { newValue in
                                    print("New Confirmed Password Value: \(newValue)")
                                }
                            HStack {
                                Toggle(isOn: $isChecked) {
                                    Text("I agree to Tretta’s Terms of Service and Privacy Policy.")
                                }
                                .toggleStyle(CheckboxToggleStyle())
                                .padding(.horizontal, 40)
                                .padding(.top, 24)
                                Spacer()
                            }
                            .padding(.top, 24)
                        }
                        Spacer()
                    }
                    .background(Color.backgroundBlue)
                    .navigationTitle("Create Account")
                    .navigationBarBackButtonHidden(true)
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            Button {
                                dismiss()
                            } label: {
                                Image(systemName: "xmark")
                                    .foregroundColor(.trettaGold)
                            }
                        }
                    }
                }
                Button("Sign Up") {
                    registerUser {
                        route = .rootMain(0)
                    }
                }
                .buttonStyle(PillButton())
                .padding(.bottom, 32)
            }.background(Color.backgroundBlue)
        }
    }
    
    func registerUser(completion: @escaping EmptyCompletionHandler) {
        let user = CreateUserDTO(
            email: emailText,
            password: passwordText,
            firstName: firstNameText,
            lastName: lastNameText
        )
        
        UserService.createUser(user: user) { result in
            switch result {
            case let .success(user):
                KeyStorage.shared.set(user._id, forKey: Constants.accountIdKey)
                AnalyticsManager.shared.log(.createAccountSucceeded)
                completion()
            case let .failure(error):
                AnalyticsManager.shared.log(.createAccountFailed(reason: error.localizedDescription))
                print("Create User Error: \(error)")
            }
        }
    }
    
}

//struct SignUpNameScreen_Previews: PreviewProvider {
//    @State private static var initialRoute: Route = .onboarding(.signUpName)
//    static var previews: some View {
//        SignUpNameScreen(route: $initialRoute)
//    }
//}
