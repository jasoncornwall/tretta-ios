//
//  EmptyStateType.swift
//  Tretta
//
//  Created by Jason C on 6/21/23.
//

import Foundation

enum EmptyStateType {
    case homeGraph
    case homeRecent
    case contact
    case deal
    case note
    
    var image: String {
        switch self {
        case .homeGraph:
            return "contacts_icon"
        case .homeRecent:
            return "contacts_icon"
        case .contact:
            return "contacts_icon"
        case .deal:
            return "contacts_icon"
        case .note:
            return "contacts_icon"
        }
    }
    
    var title: String {
        switch self {
        case .homeGraph:
            return "Your Pipeline Data is Empty"
        case .homeRecent:
            return "No Recent Data"
        case .contact:
            return "Your Contact List is Empty"
        case .deal:
            return "An Empty Pipeline!"
        case .note:
            return "No Notes"
        }
    }
    
    var description: String {
        switch self {
        case .homeGraph:
            return "Looks like you haven't added any deals yet."
        case .homeRecent:
            return "You haven't added any contacts or deals yet."
        case .contact:
            return "Looks like you haven't added any contacts yet."
        case .deal:
            return "Add some deals to get started."
        case .note:
            return "Your notes will be here."
        }
    }
}
