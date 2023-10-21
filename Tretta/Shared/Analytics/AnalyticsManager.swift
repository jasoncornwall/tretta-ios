//
//  AnalyticsManager.swift
//  Tretta
//
//  Created by Jason C on 10/20/23.
//

import Foundation
import Mixpanel

class AnalyticsManager {
    static let shared = AnalyticsManager()
    private init() {}
    
    func log(_ event: AnalyticsEvent) {
        let accountId = KeyStorage.shared.getStringValue(forKey: Constants.accountIdKey) ?? ""
        
        switch event {
        case let .signInFailed(reason),
            let .createAccountFailed(reason),
            let .createContactFailed(reason),
            let .documentScanFailed(reason),
            let .createPipelineFailed(reason),
            let .addPropertyFailed(reason),
            let .roomScanFailed(reason):
            Mixpanel.mainInstance().track(event: event.name, properties: [
                "User ID": accountId,
                "Error reason": reason
            ])
        default:
            Mixpanel.mainInstance().track(event: event.name, properties: [
                "User ID": accountId
            ])
        }
    }
}
