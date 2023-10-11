//
//  SettingsScreen.swift
//  Tretta
//
//  Created by Jason C on 6/9/23.
//

import SwiftUI

struct SettingsScreen: View {
    @Binding var route: Route
    
    var body: some View {
        NavigationStack {
            VStack {
                Rectangle()
                    .frame(height: 0.5)
                    .foregroundColor(.clear)
                List {
                    Section(header: Text("Account").background(.clear)) {
                        SettingRow(settingTitle: "Profile")
                    }
                    
                    Section(header: Text("App Settings")) {
                        SettingRow(settingTitle: "Enable Notifications")
                        SettingRow(settingTitle: "Language")
                    }
                    
                    Section(header: Text("Security")) {
                        SettingRow(settingTitle: "Password Reset")
                        SettingRow(settingTitle: "Language")
                    }
                    
                    Section(header: Text("Support")) {
                        SettingRow(settingTitle: "Contact Us")
                    }
                }.listStyle(.plain)
                HStack {
                    Spacer()
                    Button {
                        KeyStorage.shared.clearValue(forKey: Constants.accessToken)
                        KeyStorage.shared.clearValue(forKey: Constants.accountIdKey)
                        route = .onboarding(.signIn)
                    } label: {
                        Text("Sign Out")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(.cancelRed)
                    }
                    Spacer()
                }
                .background(Color.backgroundBlue)
                .padding(.bottom, 2)
                .padding(.top, 8)
                Text("Tretta CRM v1.0.0")
                    .font(.system(size: 11))
                    .padding(.bottom, 16)
            }
            .background(Color.backgroundBlue)
            .navigationTitle("Settings")
            .navigationBarBackButtonHidden(true)
        }
    }
}
