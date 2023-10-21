//
//  TrettaApp.swift
//  Tretta
//
//  Created by Jason C on 4/9/23.
//

import Mixpanel
import SendbirdChatSDK
import SendbirdUIKit
import SwiftUI

@main
struct TrettaApp: App {
    @UIApplicationDelegateAdaptor private var appDelegate: AppDelegate
        
    var body: some Scene {
        WindowGroup {
            AppContainerView()
        }
    }
    
    init() {
        self.navigationStyleSetup()
    }
    
    private func navigationStyleSetup() {
        let navBarAppearance = UINavigationBar.appearance()
        navBarAppearance.largeTitleTextAttributes = [
            .foregroundColor: UIColor(Color.trettaGold),
            .font: UIFont.systemFont(ofSize: 30, weight: .bold)
        ]
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor(Color.trettaGold)]
        
        let placeholder = NSAttributedString(string: "Search", attributes: [.foregroundColor: UIColor.white.withAlphaComponent(0.5)])
        
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).backgroundColor = UIColor(Color.homeBodySectionBlue)
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).attributedPlaceholder = placeholder
        UISearchBar.appearance().setImage(searchBarImage(), for: .search, state: .normal)
    }
    
    private func searchBarImage() -> UIImage {
        let image = UIImage(systemName: "magnifyingglass")
        return image!.withTintColor(.white.withAlphaComponent(0.5), renderingMode: .alwaysOriginal)
    }
}

class AppDelegate: NSObject, UIApplicationDelegate, ObservableObject {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        self.initializeSendbird()
        
        Mixpanel.initialize(token: Constants.mixpanelToken, trackAutomaticEvents: false)
        
        return true
    }
    
    private func initializeSendbird() {
        SBUTheme.set(theme: .dark)
        
        SendbirdUI.initialize(applicationId: Constants.sendbirdAppId) { error in
            if let error {
                print("Sendbird error: \(error)")
            }
            
            let accountId = KeyStorage.shared.getStringValue(forKey: Constants.accountIdKey) ?? ""
            SBUGlobals.currentUser = SBUUser(userId: accountId)
            
            let initParams = InitParams(applicationId: Constants.sendbirdAppId)
            SendbirdChat.initialize(params: initParams)
            SendbirdChat.connect(userId: accountId)
        }
    }
    
}
