//
//  ContactScreenModel.swift
//  Tretta
//
//  Created by Jason C on 7/26/23.
//

import Alamofire
import SwiftUI

@MainActor
class ContactScreenModel: ObservableObject {
    @Published var searchText = ""
    @Published var contacts: [Contact] = []
    
    func refreshContacts(completion: @escaping ErrorCompletionHandler) {
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
                        completion(nil)
                    case let .failure(error):
                        allContacts.sort { $0.firstName < $1.firstName }
                        self.contacts = allContacts
                        completion(error.asAFError)
                        print("Error fetching local contacts: \(error)")
                    }
                }
            case let .failure(error):
                completion(error)
                print("Error loading remote contacts: \(error)")
            }
        }
    }
    
    private func loadContacts(completion: @escaping GetContactsCompletionHandler) {
        let accountId = KeyStorage.shared.getStringValue(forKey: Constants.accountIdKey) ?? ""
        ContactApiService.getContacts(accountId: accountId, completion: completion)
    }
}
