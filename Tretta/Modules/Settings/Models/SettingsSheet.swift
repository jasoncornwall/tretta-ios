//
//  SettingsSheet.swift
//  Tretta
//
//  Created by Jason C on 10/17/23.
//

import Foundation
import SendbirdChatSDK

enum SettingsSheet: Hashable, Identifiable {
    var id: Self {
        return self
    }
    
    case contactUs
    case assistant(GroupChannel)
    case privacyPolicy
    case terms
}
