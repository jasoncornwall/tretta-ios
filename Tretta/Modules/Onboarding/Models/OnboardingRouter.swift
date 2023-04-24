//
//  OnboardingRouter.swift
//  Tretta
//
//  Created by Jason C on 4/9/23.
//

import SwiftUI

struct OnboardingRouter {
    @State var route: Route
    
    @ViewBuilder
    func setup() -> some View {
        switch route {
        case .onboarding(.signIn):
            SignInScreen(route: $route)
        case .onboarding(.signUpName):
            SignUpNameScreen()
        case .onboarding(.signUpEmailPassword):
            SignUpAccountScreen()
        case .onboarding(.resetPassword):
            ResetPasswordScreen()
        default:
            SignInScreen(route: $route)
        }
    }
}
