//
//  SettingsScreen.swift
//  Tretta
//
//  Created by Jason C on 6/9/23.
//

import MessageUI
import SendbirdChatSDK
import SwiftUI

struct SettingsScreen: View {
    @Binding var route: Route
    @State private var presentedSheet: SettingsSheet?
    
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
                                    presentedSheet = .contactUs
                                }
                        }
                        
                        SettingRow(type: .assistant)
                            .onTapGesture {
                                getSupportChannel { channel in
                                    presentedSheet = .assistant(channel)
                                }
                            }
                    }
                }.listStyle(.plain)
                Spacer()
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
        .fullScreenCover(item: $presentedSheet) { sheet in
            switch sheet {
            case .contactUs:
                MailView(contactEmail: "support@trettacrm.io")
            case let .assistant(channel):
                SupportChatScreen(channel: channel)
            }
        }
    }
    
    func getSupportChannel(completion: @escaping (GroupChannel) -> ()) {
        let params = GroupChannelCreateParams()
        params.userIds = [Constants.sendbirdSupportId]
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
