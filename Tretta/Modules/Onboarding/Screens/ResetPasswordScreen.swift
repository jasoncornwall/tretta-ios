//
//  ResetPasswordScreen.swift
//  Tretta
//
//  Created by Jason C on 4/14/23.
//

import SwiftUI

struct ResetPasswordScreen: View {
    
    @State private var newPasswordText = ""
    @State private var confirmedPasswordText = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                    .frame(height: 64)
                Group {
                    FloatingTextField(title: "NEW PASSWORD", text: $newPasswordText)
                        .padding(.horizontal, 40)
                        .onChange(of: newPasswordText) { newValue in
                            print("New Password Value: \(newValue)")
                        }
                    Spacer()
                        .frame(height: 48)
                    FloatingTextField(title: "CONFIRM PASSWORD", text: $confirmedPasswordText)
                        .padding(.horizontal, 40)
                        .onChange(of: confirmedPasswordText) { newValue in
                            print("New Confirmed Password Value: \(newValue)")
                        }
                }
                Spacer()
                Button("RESET PASSWORD") {
                    print("Reset Password tapped.")
//                    navigationState.routes.removeAll()
                }
                .buttonStyle(PillButton())
                .padding(.bottom, 32)
            }
            .background(Color.backgroundBlue)
            .navigationTitle("Reset your password.")
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

struct ResetPasswordScreen_Previews: PreviewProvider {
    static var previews: some View {
        ResetPasswordScreen()
    }
}
