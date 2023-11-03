//
//  RootMainView.swift
//  Tretta
//
//  Created by Jason C on 4/19/23.
//
import RevenueCat
import SwiftUI

struct RootMainView: View {
    private var route: Binding<Route>
    @State private var selection: Int = 0
    
    var body: some View {
        TabView(selection: $selection) {
            Group {
                HomeScreen(route: self.route, model: HomeScreenModel())
                    .tabItem {
                        if selection == 0 {
                            Label("", image: "selected_home_icon")
                        } else {
                            Label("", image: "home_icon")
                        }
                    }.tag(0)

                ContactScreen(route: self.route, model: ContactScreenModel())
                    .tabItem {
                        if selection == 1 {
                            Label("", image: "selected_contacts_icon")
                        } else {
                            Label("", image: "contacts_icon")
                        }
                    }.tag(1)
                
                PipelineScreen(route: self.route, model: PipelineScreenModel())
                    .tabItem {
                        if selection == 2 {
                            Label("", image: "selected_pipeline_icon")
                        } else {
                            Label("", image: "pipeline_icon")
                        }
                    }.tag(2)
                
                CalendarScreen(route: self.route, model: CalendarScreenModel())
                    .tabItem {
                        if selection == 3 {
                            Label("", image: "selected calendar icon")
                        } else {
                            Label("", image: "calendar icon")
                        }
                    }.tag(3)
                
                SettingsScreen(route: self.route)
                    .tabItem {
                        if selection == 4 {
                            Label("", image: "selected_settings_icon")
                        } else {
                            Label("", image: "settings_icon")
                        }
                    }.tag(4)
            }
        }
        .background(Color.backgroundBlue)
    }
    
    init(route: Binding<Route>, selection: Int) {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(Color.tabBarBackground)
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
        self.route = route
        self.selection = selection
        
        let accountId = KeyStorage.shared.getStringValue(forKey: Constants.accountIdKey) ?? ""
        Purchases.logLevel = BuildConfiguration.shared.environment == .staging ? .debug : .error
        Purchases.configure(withAPIKey: Constants.revenueCatAPIKey, appUserID: accountId)
    }
}

//struct RootMainView_Previews: PreviewProvider {
//    static var previews: some View {
//        RootMainView()
//    }
//}
