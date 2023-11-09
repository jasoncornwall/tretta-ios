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
    static let supportEmail = "support@trettacrm.com"
    static let privacyPolicyURL = URL(string: "https://www.termsfeed.com/live/80881f4c-e03d-44f5-bc66-24bb9012d96d")!
    static let termsAndConditionsURL = URL(string: "https://www.termsfeed.com/live/c5d02ed1-35ee-42b8-a093-ae6ac031685e")!
    static let revenueCatAPIKey = "appl_kCDLHllHYyEFfxoRKRPVOFjwtlu"
    static let requiredEntitlementIdentifier = "pro"
    static let appReviewerAccountId = "6547cfc34c57cf181ebb704d"
    
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
    
    static var mixpanelToken: String {
        switch BuildConfiguration.shared.environment {
        case .staging:
            return "83d149469203010a65abb930157f701a"
        case .production:
            return "9542d2efbfc6a7b374e354ee736a9d02"
        }
    }
}
