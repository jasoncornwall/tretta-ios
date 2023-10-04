//
//  UserRouter.swift
//  Tretta
//
//  Created by Jason C on 7/5/23.
//

import Alamofire
import Foundation

enum UserRouter: URLRequestConvertible {
    case createUser(user: CreateUserDTO)
    case getUserByEmail(String)
    
    var method: HTTPMethod {
        switch self {
        case .getUserByEmail:
            return .get
        case .createUser:
            return .post
        }
    }
    
    var path: String {
        switch self {
        case let .getUserByEmail(email):
            return "users/email/\(email)"
        case .createUser:
            return "users"
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = Constants.baseURL.appendingPathComponent(path)
        var request = URLRequest(url: url)
        request.method = method
        
        switch self {
        case .getUserByEmail:
            break
        case let .createUser(user):
            let params = [
                "email": user.email,
                "first_name": user.firstName,
                "last_name": user.lastName,
                "password": user.password
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
