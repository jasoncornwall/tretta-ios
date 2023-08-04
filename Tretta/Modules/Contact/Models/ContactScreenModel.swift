//
//  ContactScreenModel.swift
//  Tretta
//
//  Created by Jason C on 7/26/23.
//

import SwiftUI

@MainActor
class ContactScreenModel: ObservableObject {
    @Published var searchText = ""
    @Published var contacts: [Contact] = []
    
    func loadContacts() {
        contacts = ContactMockData.contacts
    }
}
