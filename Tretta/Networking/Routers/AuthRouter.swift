//
//  AuthRouter.swift
//  Tretta
//
//  Created by Jason C on 7/9/23.
//

import Alamofire
import Foundation

enum AuthRouter: URLRequestConvertible {
    case login(email: String, password: String)
    
    var method: HTTPMethod {
        switch self {
        case .login:
            return .post
        }
    }
    
    var path: String {
        switch self {
        case .login:
            return "auth/login"
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = Constants.baseURL.appendingPathComponent(path)
        var request = URLRequest(url: url)
        request.method = method
        
        switch self {
        case let .login(email, password):
            let params = [
                "email": email,
                "password": password
            ]
            do {
                request.httpBody = try JSONEncoder().encode(params)
            } catch {
                print(error)
            }
        }
        
        request.headers.add(.contentType(Constants.jsonContentType))
                
        return request
    }
}
