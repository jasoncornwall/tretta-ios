//
//  SettingsScreen.swift
//  Tretta
//
//  Created by Jason C on 6/9/23.
//

import RevenueCat
import RevenueCatUI
import MessageUI
import SendbirdChatSDK
import SwiftUI

struct SettingsScreen: View {
    @Binding var route: Route
    @State private var presentedSheet: SettingsSheet?
    @State private var showingSignOutOptions = false
    @State private var showingAccountDeletionOptions = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Rectangle()
                    .frame(height: 0.5)
                    .foregroundColor(.clear)
                List {
                    Section(header: Text("Support")) {
                        if MFMailComposeViewController.canSendMail() {
                            SettingRow(type: .contactUs)
                                .onTapGesture {
                                    AnalyticsManager.shared.log(.feedbackInitiated)
                                    presentedSheet = .contactUs
                                }
                        }
                        
                        SettingRow(type: .assistant)
                            .onTapGesture {
                                AnalyticsManager.shared.log(.smartAssistantInitiated)
                                
                                getSupportChannel { channel in
                                    presentedSheet = .assistant(channel)
                                }
                            }
                    }
                    
                    Section(header: Text("Legal")) {
                        SettingRow(type: .privacyPolicy)
                            .onTapGesture {
                                presentedSheet = .privacyPolicy
                            }
                        
                        SettingRow(type: .terms)
                            .onTapGesture {
                                presentedSheet = .terms
                            }
                    }
                    
                    Section(header: Text("Account")) {
                        SettingRow(type: .signOut)
                            .onTapGesture {
                                showingSignOutOptions.toggle()
                            }
                            .confirmationDialog("Are you sure?", isPresented: $showingSignOutOptions, titleVisibility: .visible) {
                                Button("Sign Out") {
                                    AnalyticsManager.shared.log(.signOutTapped)
                                    KeyStorage.shared.clearValue(forKey: Constants.accessToken)
                                    KeyStorage.shared.clearValue(forKey: Constants.accountIdKey)
                                    route = .onboarding(.signIn)
                                }
                                
                                Button("Cancel", role: .cancel) {}
                            }
                    }
                }.listStyle(.plain)
                Spacer()
                HStack {
                    Spacer()
                    Button {
                        showingAccountDeletionOptions.toggle()
                    } label: {
                        Text("Delete Account")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(.cancelRed)
                    }
                    .confirmationDialog("Are you sure you want to delete your account?", isPresented: $showingAccountDeletionOptions, titleVisibility: .visible) {
                        Button("Delete Account", role: .destructive) {
                            let accountId = KeyStorage.shared.getStringValue(forKey: Constants.accountIdKey) ?? ""
                            UserService.deleteUserAccount(accountId: accountId) { _ in
                                AnalyticsManager.shared.log(.deleteAccountTapped)
                                KeyStorage.shared.clearValue(forKey: Constants.accessToken)
                                KeyStorage.shared.clearValue(forKey: Constants.accountIdKey)
                                route = .onboarding(.signIn)
                            }
                        }
                        
                        Button("Cancel", role: .cancel) {}
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
        .fullScreenCover(item: $presentedSheet) { sheet in
            switch sheet {
            case .contactUs:
                MailView(contactEmail: Constants.supportEmail)
            case let .assistant(channel):
                SupportChatScreen(channel: channel)
            case .privacyPolicy:
                NavigationStack {
                    WebView(url: Constants.privacyPolicyURL)
                        .toolbar {
                            ToolbarItem(placement: .navigationBarLeading) {
                                Button {
                                    presentedSheet = nil
                                } label: {
                                    Image(systemName: "xmark")
                                        .foregroundColor(.trettaGold)
                                }
                            }
                        }
                }.background(Color.backgroundBlue)
    
            case .terms:
                NavigationStack {
                    WebView(url: Constants.termsAndConditionsURL)
                        .toolbar {
                            ToolbarItem(placement: .navigationBarLeading) {
                                Button {
                                    presentedSheet = nil
                                } label: {
                                    Image(systemName: "xmark")
                                        .foregroundColor(.trettaGold)
                                }
                            }
                        }
                }.background(Color.backgroundBlue)
            }
        }
        .presentPaywallIfNeeded(requiredEntitlementIdentifier: Constants.requiredEntitlementIdentifier)
    }
    
    func getSupportChannel(completion: @escaping (GroupChannel) -> ()) {
        let accountId = KeyStorage.shared.getStringValue(forKey: Constants.accountIdKey) ?? ""
        let params = GroupChannelCreateParams()
        params.userIds = [Constants.sendbirdSupportId, accountId]
        params.isDistinct = true
        
        GroupChannel.createChannel(params: params) { channel, error in
            if let error {
                print("Error creating sendbird channel: \(error)")
                return
            }

            guard let channel else { return }
            completion(channel)
        }
    }
}
