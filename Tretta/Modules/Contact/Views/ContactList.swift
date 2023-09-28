//
//  ContactList.swift
//  Tretta
//
//  Created by Jason C on 4/19/23.
//

import SwiftUI

struct ContactList: View {
    @State var contacts: [Contact]
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
            .sheet(item: $selectedContact) { contact in
                ContactDetailScreen(contact: contact)
            }
    }
}
