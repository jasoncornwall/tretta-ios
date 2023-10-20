//
//  Constants.swift
//  Tretta
//
//  Created by Jason C on 7/5/23.
//

import Foundation

struct Constants {
    static let jsonContentType = "application/json"
    static let keychainService = "com.tretta-crm.keystorage"
    static let accountIdKey = "accountIdKey"
    static let accessToken = "accessToken"
    static let sendbirdAppId = "62C670F2-6EEE-4DDD-9484-F8EF73396DBC"
    static let supportEmail = "trettacrmfeedback@gmail.com"
    
    static var baseURL: URL {
        switch BuildConfiguration.shared.environment {
        case .staging:
            return URL(string: "https://tretta-api-staging.herokuapp.com/")!
        case .production:
            return URL(string: "https://tretta-api-production.herokuapp.com/")!
        }
    }
    
    static var sendbirdSupportId: String {
        switch BuildConfiguration.shared.environment {
        case .staging:
            return "test-bot-1"
        case .production:
            return "test-bot-1"
        }
    }
}
