//
//  ContactList.swift
//  Tretta
//
//  Created by Jason C on 4/19/23.
//

import SwiftUI

struct ContactList: View {
    @Binding var route: Route
    @State var contacts: [Contact]
    
    var body: some View {
        List {
            ForEach(Array(contacts.enumerated()), id: \.element) { index, contact in
                ContactRow(contactName: "\(contact.firstName) \(contact.lastName)", index: index)
                    .listRowSeparator(.hidden)
                    .listRowInsets(EdgeInsets())
                    .onTapGesture {
                        print("Contact tapped: \(contact.firstName) \(contact.lastName)")
                        route = .contact(.detail)
                    }
            }
        }
        .listStyle(.plain)
    }
}
