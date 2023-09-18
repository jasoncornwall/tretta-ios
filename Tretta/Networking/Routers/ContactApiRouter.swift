//
//  ContactApiRouter.swift
//  Tretta
//
//  Created by Jason C on 8/7/23.
//

import Alamofire
import Foundation

enum ContactApiRouter: URLRequestConvertible {
    case getContacts(accountId: String)
    case createContact(contact: Contact)
    
    var method: HTTPMethod {
        switch self {
        case .getContacts:
            return .get
        case .createContact:
            return .post
        }
    }
    
    var path: String {
        switch self {
        case let .getContacts(accountId):
            return "contacts/users/\(accountId)"
        case .createContact:
            return "contacts"
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = Constants.baseURL.appendingPathComponent(path)
        var request = URLRequest(url: url)
        request.method = method
        
        switch self {
        case .getContacts:
            break
        case let .createContact(contact):
            let params = [
                "first_name": contact.firstName,
                "last_name": contact.lastName,
                "phone": contact.phone,
                "user_id": contact.userId
            ]
            do {
                request.httpBody = try JSONEncoder().encode(params)
            } catch {
                print(error)
            }
        }
        
        let accessToken = KeyStorage.shared.getStringValue(forKey: Constants.accessToken) ?? ""
        
        request.headers.add(.contentType(Constants.jsonContentType))
        request.headers.add(.authorization(bearerToken: accessToken))
                
        return request
    }
}
