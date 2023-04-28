//
//  SignUpNameScreen.swift
//  Tretta
//
//  Created by Jason C on 4/14/23.
//

import SwiftUI

struct SignUpNameScreen: View {
    @Binding var route: Route
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
                    route = .onboarding(.signUpEmailPassword)
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
                        route = .onboarding(.addCompany)
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
    @State private static var initialRoute: Route = .onboarding(.signUpName)
    static var previews: some View {
        SignUpNameScreen(route: $initialRoute)
    }
}
