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
    
    func refreshContacts() {
        var allContacts: [Contact] = []
        
        loadContacts { result in
            switch result {
            case let .success(remoteContacts):
                allContacts.append(contentsOf: remoteContacts)
                ContactApiService.importLocalContacts { importResult in
                    switch importResult {
                    case let .success(localContacts):
                        allContacts.append(contentsOf: localContacts)
                        
                        allContacts.sort { $0.firstName < $1.firstName }
                        self.contacts = allContacts
                    case let .failure(error):
                        allContacts.sort { $0.firstName < $1.firstName }
                        self.contacts = allContacts
                        print("Error fetching local contacts: \(error)")
                    }
                }
            case let .failure(error):
                print("Error loading remote contacts: \(error)")
            }
        }
    }
    
    private func loadContacts(completion: @escaping GetContactsCompletionHandler) {
        let accountId = KeyStorage.shared.getStringValue(forKey: Constants.accountIdKey) ?? ""
        ContactApiService.getContacts(accountId: accountId, completion: completion)
    }
        
//    func getRandomMockContact(userId: String) -> Contact {
//        let contact1 = ContactMockData.contacts[Int.random(in: 0..<ContactMockData.contacts.count)]
//        let contact2 = ContactMockData.contacts[Int.random(in: 0..<ContactMockData.contacts.count)]
//        let contact3 = ContactMockData.contacts[Int.random(in: 0..<ContactMockData.contacts.count)]
//        let contact4 = ContactMockData.contacts[Int.random(in: 0..<ContactMockData.contacts.count)]
//        return Contact(
//            _id: "\(Int.random(in: 0..<1234891234987))",
//            firstName: contact1.firstName,
//            lastName: contact2.lastName,
//            email: contact3.email,
//            phone: contact4.phone,
//            userId: userId
//        )
//    }
}
