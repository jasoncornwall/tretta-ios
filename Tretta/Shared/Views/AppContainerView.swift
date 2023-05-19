//
//  AppContainerView.swift
//  Tretta
//
//  Created by Jason C on 4/9/23.
//

import SwiftUI

struct AppContainerView: View {
    @State private var currentRoute: Route = .onboarding(.signIn)
    
    var body: some View {
        ZStack {
            switch currentRoute {
            case .onboarding(let onboardingRoute):
                let screen = OnboardingRouter(route: $currentRoute).setup()
                
                switch onboardingRoute {
                case .signIn:
                    SignInScreen(route: $currentRoute)
                case .resetPassword:
                    screen
                        .transition(.move(edge: .bottom))
                        .zIndex(1)
                default:
                    screen
                        .transition(.move(edge: .trailing))
                        .zIndex(1)
                }
            case let .rootMain(tabValue):
                RootMainView(route: $currentRoute, selection: tabValue ?? 0)
                    .transition(.move(edge: .bottom))
                    .zIndex(1)
            case .home(let homeRoute):
                let screen = HomeRouter(route: homeRoute).setup()
                screen
                    .transition(.move(edge: .bottom))
                    .zIndex(1)
            case .contact:
                let screen = ContactRouter(route: $currentRoute).setup()
                screen
                    .transition(.move(edge: .bottom))
                    .zIndex(1)
            case .pipeline:
                let screen = PipelineRouter(route: $currentRoute, model: PipelineScreenModel()).setup()
                screen
                    .transition(.move(edge: .bottom))
                    .zIndex(1)
            }
        }
        .background(Color.backgroundBlue)
        .preferredColorScheme(.dark)
    }
}
