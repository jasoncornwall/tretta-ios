//
//  AppContainerView.swift
//  Tretta
//
//  Created by Jason C on 4/9/23.
//

import SwiftUI

struct AppContainerView: View {
//    @State private var showRootTabView = false
    @State private var currentRoute: Route = .onboarding(.signIn)
    
    var body: some View {
        // This currently functions as the nav root.
//        ZStack {
//            if !showRootTabView {
//                SignInScreen(showRootTabView: $showRootTabView)
//            } else {
//                RootMainView()
//                    .transition(.move(edge: .bottom))
//                    .zIndex(1)
//            }
//        }
        
        ZStack {
            switch currentRoute {
            case .onboarding(let onboardingRoute):
                let screen = OnboardingRouter(route: currentRoute).setup()
                
                switch onboardingRoute {
                case .signIn:
                    SignInScreen(route: $currentRoute)
                default:
                    screen
                        .transition(.move(edge: .trailing))
                        .zIndex(1)
                }
            case .rootMain:
                RootMainView()
                    .transition(.move(edge: .bottom))
                    .zIndex(1)
            case .home(let homeRoute):
                let screen = HomeRouter(route: homeRoute).setup()
                screen
                    .transition(.move(edge: .bottom))
                    .zIndex(1)
            case .contact(let contactRoute):
                let screen = ContactRouter(route: contactRoute).setup()
                screen
                    .transition(.move(edge: .bottom))
                    .zIndex(1)
            }
        }
        .background(Color.backgroundBlue)
    }
}
