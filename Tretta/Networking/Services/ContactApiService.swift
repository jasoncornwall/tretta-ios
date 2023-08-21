//
//  ContactApiService.swift
//  Tretta
//
//  Created by Jason C on 8/8/23.
//

import Alamofire
import Foundation

typealias CreateContactCompletionHandler = (Result<Contact, AFError>) -> Void
typealias GetContactsCompletionHandler = (Result<[Contact], AFError>) -> Void

class ContactApiService {
    
    private static let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
    
    static func createContact(contact: Contact, completion: @escaping CreateContactCompletionHandler) {
        AF.request(ContactApiRouter.createContact(contact: contact))
            .responseDecodable(of: Contact.self, decoder: decoder) { response in
                completion(response.result)
            }
    }
    
    static func getContacts(accountId: String, completion: @escaping GetContactsCompletionHandler) {
        AF.request(ContactApiRouter.getContacts(accountId: accountId))
            .responseDecodable(of: [Contact].self, decoder: decoder) { response in
                completion(response.result)
            }
    }
    
}
