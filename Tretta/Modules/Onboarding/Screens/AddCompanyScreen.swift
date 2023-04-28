//
//  AddCompanyScreen.swift
//  Tretta
//
//  Created by Jason C on 4/14/23.
//

import SwiftUI

struct AddCompanyScreen: View {
    @Binding var route: Route
    @State private var companyNameText = ""
    @State private var companyWebsiteText = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                    .frame(height: 64)
                Group {
                    FloatingTextField(title: "COMPANY NAME", text: $companyNameText)
                        .padding(.horizontal, 40)
                        .onChange(of: companyNameText) { newValue in
                            print("New Password Value: \(newValue)")
                        }
                    Spacer()
                        .frame(height: 48)
                    FloatingTextField(title: "COMPANY WEBSITE", text: $companyWebsiteText)
                        .padding(.horizontal, 40)
                        .onChange(of: companyWebsiteText) { newValue in
                            print("New Confirmed Password Value: \(newValue)")
                        }
                }
                Spacer()
                Button("NEXT") {
                    route = .onboarding(.signUpName)
                }
                .buttonStyle(PillButton())
                .padding(.bottom, 32)
            }
            .background(Color.backgroundBlue)
            .navigationTitle("Add your company.")
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        withAnimation {
                            route = .onboarding(.signIn)
                        }
                    } label: {
                        Image(systemName: "chevron.backward")
                            .foregroundColor(.trettaGold)
                    }
                }
            }
        }
    }
}

struct AddCompanyScreen_Previews: PreviewProvider {
    @State private static var initialRoute: Route = .onboarding(.addCompany)
    static var previews: some View {
        AddCompanyScreen(route: $initialRoute)
    }
}
