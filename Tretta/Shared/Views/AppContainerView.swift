//
//  AppContainerView.swift
//  Tretta
//
//  Created by Jason C on 4/9/23.
//

import SwiftUI

struct AppContainerView: View {
    var body: some View {
        NavigationStack {
            SignInScreen()
                .navigationDestination(for: Route.self) { containerRoute in
                    switch containerRoute {
                    case let .onboarding(route):
                        OnboardingRouter(route: route).setUp()
                    case .rootMain:
                        Text("Root Main")
                    }
                }
        }
    }
}
