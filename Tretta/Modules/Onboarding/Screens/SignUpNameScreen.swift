//
//  SignUpNameScreen.swift
//  Tretta
//
//  Created by Jason C on 4/14/23.
//

import SwiftUI

struct SignUpNameScreen: View {
    
    @State private var firstNameText = ""
    @State private var lastNameText = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                    .frame(height: 64)
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
                }
                Spacer()
                Button("NEXT") {
                    print("Reset Password tapped.")
//                    navigationState.routes.removeAll()
                }
                .buttonStyle(PillButton())
                .padding(.bottom, 32)
            }
            .background(Color.backgroundBlue)
            .navigationTitle("What's your name?")
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

struct SignUpNameScreen_Previews: PreviewProvider {
    static var previews: some View {
        SignUpNameScreen()
    }
}
