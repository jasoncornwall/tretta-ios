//
//  ContactDetailScreenModel.swift
//  Tretta
//
//  Created by Jason C on 10/3/23.
//

import SwiftUI

class ContactDetailScreenModel: ObservableObject {
    
    @Published var contact: Contact
    @Published var showDocumentScanner: Bool
    
    init(contact: Contact) {
        self.contact = contact
        self.showDocumentScanner = false
    }
    
}

