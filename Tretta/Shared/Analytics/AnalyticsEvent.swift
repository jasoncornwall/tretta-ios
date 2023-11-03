//
//  AnalyticsEvent.swift
//  Tretta
//
//  Created by Jason C on 10/20/23.
//

import Foundation

enum AnalyticsEvent {
    case signInScreenViewed
    case signInSucceeded
    case signInFailed(reason: String)
    case createAccountSucceeded
    case createAccountFailed(reason: String)
    case homeScreenViewed
    case contactScreenViewed
    case createContactSucceeded
    case createContactFailed(reason: String)
    case documentScanInitiated
    case documentScanSucceeded
    case documentScanFailed(reason: String)
    case pipelineScreenViewed
    case createPipelineSucceeded
    case createPipelineFailed(reason: String)
    case addPropertySucceeded
    case addPropertyFailed(reason: String)
    case roomScanInitiated
    case roomScanSucceeded
    case roomScanFailed(reason: String)
    case calendarScreenViewed
    case feedbackInitiated
    case smartAssistantInitiated
    case signOutTapped
    case cancelPaymentTapped
}

extension AnalyticsEvent {
    var name: String {
        switch self {
        case .signInFailed:
            return "signInFailed"
        case .createAccountFailed:
            return "createAccountFailed"
        case .createContactFailed:
            return "createContactFailed"
        case .documentScanFailed:
            return "documentScanFailed"
        case .createPipelineFailed:
            return "createPipelineFailed"
        case .addPropertyFailed:
            return "addPropertyFailed"
        case .roomScanFailed:
            return "roomScanFailed"
        default:
            return String(describing: self)
        }
    }
}
