//
//  ContactList.swift
//  Tretta
//
//  Created by Jason C on 4/19/23.
//

import SwiftUI

struct ContactList: View {
    @State var contacts: [Contact]
    @State var contactListCopy: [Contact]
    @State private var selectedContact: Contact?
    @State private var searchText = ""
    
    var body: some View {
        List {
            ForEach(Array(contactListCopy.enumerated()), id: \.element._id) { index, contact in
                ContactRow(contactName: "\(contact.firstName) \(contact.lastName)", index: index)
                    .listRowSeparator(.hidden)
                    .listRowInsets(EdgeInsets())
                    .onTapGesture {
                        selectedContact = contact
                    }
            }
        }
        .listStyle(.plain)
        .searchable(text: $searchText, prompt: "Look for a client")
        .onChange(of: searchText, perform: { newSearchValue in
            let copy = contacts
            if !newSearchValue.isEmpty {
                contactListCopy = copy.filter { $0.firstName.contains(newSearchValue) || $0.lastName.contains(newSearchValue) }
            } else {
                contactListCopy = copy
            }
        })
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
