//
//  AuthService.swift
//  Tretta
//
//  Created by Jason C on 7/9/23.
//

import Alamofire
import Foundation

typealias LoginCompletionHandler = (Result<SuccessfulLoginResponse, AFError>) -> Void

class AuthService {
    
    private static let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
    
    static func login(email: String, password: String, completion: @escaping LoginCompletionHandler) {
        AF.request(AuthRouter.login(email: email, password: password))
            .responseDecodable(of: SuccessfulLoginResponse.self, decoder: decoder) { response in
                completion(response.result)
            }
    }
    
}
