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
        
    func getRandomMockContact(userId: String) -> Contact {
        let contact1 = ContactMockData.contacts[Int.random(in: 0..<ContactMockData.contacts.count)]
        let contact2 = ContactMockData.contacts[Int.random(in: 0..<ContactMockData.contacts.count)]
        let contact3 = ContactMockData.contacts[Int.random(in: 0..<ContactMockData.contacts.count)]
        let contact4 = ContactMockData.contacts[Int.random(in: 0..<ContactMockData.contacts.count)]
        return Contact(
            firstName: contact1.firstName,
            lastName: contact2.lastName,
            email: contact3.email,
            phone: contact4.phone,
            userId: userId
        )
    }
}
