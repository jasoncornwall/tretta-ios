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
                        case let .home(route):
                            HomeRouter(route: route).setup()
                        case let .contact(route):
                            ContactRouter(route: route).setup()
                        }
                    }
            }.environmentObject(navigationState)
        }
    }
    
    init() {
        self.navigationStyleSetup()
    }
    
    private func navigationStyleSetup() {
        let navBarAppearance = UINavigationBar.appearance()
        navBarAppearance.largeTitleTextAttributes = [
            .foregroundColor: UIColor(Color.trettaGold),
            .font: UIFont.systemFont(ofSize: 30, weight: .bold)
        ]
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor(Color.trettaGold)]
        
        let placeholder = NSAttributedString(string: "Search", attributes: [.foregroundColor: UIColor.white.withAlphaComponent(0.5)])
        
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).backgroundColor = UIColor(Color.homeBodySectionBlue)
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).attributedPlaceholder = placeholder
        UISearchBar.appearance().setImage(searchBarImage(), for: .search, state: .normal)
    }
    
    private func searchBarImage() -> UIImage {
        let image = UIImage(systemName: "magnifyingglass")
        return image!.withTintColor(.white.withAlphaComponent(0.5), renderingMode: .alwaysOriginal)
    }
}
