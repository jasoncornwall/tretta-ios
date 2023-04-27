//
//  SignUpAccountScreen.swift
//  Tretta
//
//  Created by Jason C on 4/14/23.
//

import SwiftUI

struct SignUpAccountScreen: View {
    
    @State private var emailText = ""
    @State private var passwordText = ""
    @State private var isChecked = false
    
    var body: some View {
        NavigationStack {
            VStack() {
                Spacer()
                    .frame(height: 64)
                Group {
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
                }
                Spacer()
                Button("COMPLETE") {
                    print("Reset Password tapped.")
//                    navigationState.routes.removeAll()
                }
                .buttonStyle(PillButton())
                .padding(.bottom, 32)
            }
            .background(Color.backgroundBlue)
            .navigationTitle("Create your account.")
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        print("Back button tapped.")
                    } label: {
                        Image(systemName: "chevron.backward")
                            .foregroundColor(.trettaGold)
                    }
                }
            }
        }
    }
}

struct SignUpAccountScreen_Previews: PreviewProvider {
    static var previews: some View {
        SignUpAccountScreen()
    }
}
