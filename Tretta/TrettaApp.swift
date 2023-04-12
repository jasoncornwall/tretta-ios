//
//  TrettaApp.swift
//  Tretta
//
//  Created by Jason C on 4/9/23.
//

import SwiftUI

@main
struct TrettaApp: App {
    
    @StateObject private var navigationState = NavigationState()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $navigationState.routes) {
                AppContainerView()
                    .navigationDestination(for: Route.self) { selectedRoute in
                        switch selectedRoute {
                        case let .onboarding(route):
                            OnboardingRouter(route: route).setup()
                        case .rootMain:
                            Text("Root Main")
                        }
                    }
            }.environmentObject(navigationState)
        }
    }
}
