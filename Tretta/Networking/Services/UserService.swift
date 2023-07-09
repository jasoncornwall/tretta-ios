//
//  UserService.swift
//  Tretta
//
//  Created by Jason C on 7/5/23.
//

import Alamofire
import Foundation

typealias CreateUserCompletionHandler = (Result<User, AFError>) -> Void

class UserService {
    
    private static let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
    
    static func createUser(user: CreateUserDTO, completion: @escaping CreateUserCompletionHandler) {
        AF.request(UserRouter.createUser(user: user))
            .responseDecodable(of: User.self, decoder: decoder) { response in
                completion(response.result)
            }
//            Use the .responseString block for debugging de/serialization errors:
//            .responseString { response in
//                debugPrint("CREATE USER Response: \(response)")
//            }
    }
}
