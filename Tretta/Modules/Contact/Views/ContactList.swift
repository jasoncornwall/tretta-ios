//
//  ContactList.swift
//  Tretta
//
//  Created by Jason C on 4/19/23.
//

import SwiftUI

struct ContactList: View {
    @Binding var contacts: [Contact]
    @State private var selectedContact: Contact?
    
    var body: some View {
        List {
            ForEach(Array(contacts.enumerated()), id: \.element._id) { index, contact in
                ContactRow(contactName: "\(contact.firstName) \(contact.lastName)", index: index)
                    .listRowSeparator(.hidden)
                    .listRowInsets(EdgeInsets())
                    .onTapGesture {
                        selectedContact = contact
                    }
            }
        }.listStyle(.plain)
        .fullScreenCover(item: $selectedContact, content: { contact in
            let model = ContactDetailScreenModel(contact: contact)
            ContactDetailScreen(model: model)
        })
        .refreshable {
            let accountId = KeyStorage.shared.getStringValue(forKey: Constants.accountIdKey) ?? ""
            
            ContactApiService.getContacts(accountId: accountId) { result in
                switch result {
                case let .success(contacts):
                    self.contacts = contacts
                case let .failure(error):
                    print("Error fetching contacts: \(error)")
                }
            }
        }
    }
}
