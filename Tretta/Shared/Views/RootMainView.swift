//
//  RootMainView.swift
//  Tretta
//
//  Created by Jason C on 4/19/23.
//

import SwiftUI

struct RootMainView: View {
    private var route: Binding<Route>
    @State private var selection = 0
    
    var body: some View {
                TabView(selection: $selection) {
            Group {
                HomeScreen()
                    .tabItem {
                        if selection == 0 {
                            Label("", image: "selected_home_icon")
                        } else {
                            Label("", image: "home_icon")
                        }
                    }.tag(0)

                ContactScreen(route: self.route)
                    .tabItem {
                        if selection == 1 {
                            Label("", image: "selected_contacts_icon")
                        } else {
                            Label("", image: "contacts_icon")
                        }
                    }.tag(1)
            }
        }
    }
    
    init(route: Binding<Route>) {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(Color.tabBarBackground)
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
        self.route = route
    }
}

//struct RootMainView_Previews: PreviewProvider {
//    static var previews: some View {
//        RootMainView()
//    }
//}
