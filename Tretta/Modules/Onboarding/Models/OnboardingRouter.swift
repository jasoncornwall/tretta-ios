//
//  OnboardingRouter.swift
//  Tretta
//
//  Created by Jason C on 4/9/23.
//

import SwiftUI

struct OnboardingRouter {
    @Binding var route: Route
    
    @ViewBuilder
    func setup() -> some View {
        switch route {
        case .onboarding(.signIn):
            SignInScreen(route: $route)
        case .onboarding(.addCompany):
            AddCompanyScreen(route: $route)
        case .onboarding(.signUpName):
            SignUpNameScreen(route: $route)
        case .onboarding(.signUpEmailPassword):
            SignUpAccountScreen(route: $route)
        case .onboarding(.resetPassword):
            ResetPasswordScreen(route: $route)
        default:
            SignInScreen(route: $route)
        }
    }
}
