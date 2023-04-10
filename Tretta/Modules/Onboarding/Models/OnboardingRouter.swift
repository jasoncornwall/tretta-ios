//
//  OnboardingRouter.swift
//  Tretta
//
//  Created by Jason C on 4/9/23.
//

import SwiftUI

struct OnboardingRouter {
    let route: Route.OnboardingRoute
    
    @ViewBuilder
    func setUp() -> some View {
        switch route {
        case .signIn:
            Text("Sign In")
        case .signUpName:
            Text("Sign Up Name")
        case .signUpEmailPassword:
            Text("Sign Up Email Psswd")
        }
    }
}
