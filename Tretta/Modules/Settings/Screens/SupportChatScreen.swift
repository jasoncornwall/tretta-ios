//
//  SupportChatScreen.swift
//  Tretta
//
//  Created by Jason C on 10/17/23.
//

import SendbirdChatSDK
import SendbirdUIKit
import SwiftUI

struct SupportChatScreen: UIViewControllerRepresentable {
    
    let channel: GroupChannel
        
    func makeUIViewController(context: Context) -> UINavigationController {
        let vc = TrettaGroupChannelViewController(channel: channel)
        return UINavigationController(rootViewController: vc)
    }
    
    func updateUIViewController(_ uiViewController: UINavigationController, context: Context) {
        
    }
    
}
