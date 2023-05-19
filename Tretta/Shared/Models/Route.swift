//
//  Route.swift
//  Tretta
//
//  Created by Jason C on 4/9/23.
//

import Foundation

enum Route: Hashable {
    case onboarding(OnboardingRoute)
    case rootMain(Int?)
    case home(HomeRoute)
    case contact(ContactRoute)
    case pipeline(PipelineRoute)
}

// MARK: - Onboarding

extension Route {
    enum OnboardingRoute: Hashable {
        case signIn
        case addCompany
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
        case detail(Contact)
    }
}

// MARK: - Pipeline

extension Route {
    enum PipelineRoute: Hashable {
        case main
        case detail(Deal)
    }
}
