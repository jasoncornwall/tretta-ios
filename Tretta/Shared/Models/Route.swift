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
    case home(HomeRoute)
    case contact(ContactRoute)
}

// MARK: - Onboarding

extension Route {
    enum OnboardingRoute: Hashable {
        case signIn
        case signUpName
        case signUpEmailPassword
        case resetPassword
    }
}

// MARK: - Home

extension Route {
    enum HomeRoute: Hashable {
        case main
    }
}

// MARK: - Contact

extension Route {
    enum ContactRoute: Hashable {
        case main
        case detail
    }
}
