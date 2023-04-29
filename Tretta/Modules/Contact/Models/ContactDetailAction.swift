//
//  ContactDetailAction.swift
//  Tretta
//
//  Created by Jason C on 4/28/23.
//

import Foundation

enum ContactDetailAction {
    case message(isEnabled: Bool)
    case call(isEnabled: Bool)
    case mail(isEnabled: Bool)
    
    var imageName: String {
        switch self {
        case let .message(isEnabled):
            return isEnabled ? "contact detail message" : "contact detail message disabled"
        case let .call(isEnabled):
            return isEnabled ? "contact detail call" : "contact detail call disabled"
        case let .mail(isEnabled):
            return isEnabled ? "contact detail mail" : "contact detail mail disabled"
        }
    }
}
