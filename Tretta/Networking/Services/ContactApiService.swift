//
//  ContactApiService.swift
//  Tretta
//
//  Created by Jason C on 8/8/23.
//

import Alamofire
import Contacts
import Foundation

typealias GetContactsCompletionHandler = (Result<[Contact], AFError>) -> Void
typealias ImportLocalContactsCompletionHandler = (Result<[Contact], Error>) -> Void
typealias CreateContactCompletionHandler = (Result<Contact, AFError>) -> Void

class ContactApiService {
    
    private static let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
    
    static func getContacts(accountId: String, completion: @escaping GetContactsCompletionHandler) {
        AF.request(ContactApiRouter.getContacts(accountId: accountId))
            .validate(statusCode: 200..<300)
            .responseDecodable(of: [Contact].self, decoder: decoder) { response in
                completion(response.result)
            }
    }
    
    static func createContact(contact: CreateContactDTO, completion: @escaping CreateContactCompletionHandler) {
        AF.request(ContactApiRouter.createContact(contact: contact))
            .validate(statusCode: 200..<300)
            .responseDecodable(of: Contact.self, decoder: decoder) { response in
                completion(response.result)
            }
    }
    
    static func importLocalContacts(completion: @escaping ImportLocalContactsCompletionHandler) {
        let store = CNContactStore()
        store.requestAccess(for: .contacts) { accessGranted, error in
            if let error {
                completion(.failure(error))
            }
            
            if accessGranted {
                let keys = [
                    CNContactGivenNameKey,
                    CNContactFamilyNameKey,
                    CNContactPhoneNumbersKey,
                    CNContactEmailAddressesKey
                ] as [CNKeyDescriptor]
                
                let request = CNContactFetchRequest(keysToFetch: keys)
                
                var contacts: [Contact] = []
                
                DispatchQueue.global(qos: .background).async {
                    do {
                        try store.enumerateContacts(with: request, usingBlock: { contact, stopPointer in
                            let localContact = Contact(localContact: contact)
                            contacts.append(localContact)
                        })
                        
                        contacts.sort { $0.firstName < $1.firstName }
                        
                        DispatchQueue.main.async {
                            completion(.success(contacts))
                        }
                    } catch {
                        DispatchQueue.main.async {
                            completion(.failure(error))
                        }
                    }
                }
            } else {
                completion(.failure(ContactError.importError("Local contact import access denied.")))
            }
        }
    }
    
}

extension ContactApiService {
    
    enum ContactError: Error {
        case importError(String)
    }
    
}
