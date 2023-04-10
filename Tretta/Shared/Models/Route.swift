//
//  Route.swift
//  Tretta
//
//  Created by Jason C on 4/9/23.
//

import Foundation

enum Route: Hashable {
    case onboarding(OnboardingRoute)
    case rootMain
}

// MARK: - Onboarding

extension Route {
    enum OnboardingRoute: Hashable {
        case signIn
        case signUpName
        case signUpEmailPassword
    }
}
