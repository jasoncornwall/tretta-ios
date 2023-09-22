//
//  HomeScreen.swift
//  Tretta
//
//  Created by Jason C on 4/14/23.
//

import SwiftUI

struct HomeScreen: View {
//    @EnvironmentObject private var navigationState: NavigationState
    @Binding var route: Route
    @StateObject var model: HomeScreenModel
    
    var body: some View {
        NavigationStack {
            Group {
                VStack {
                    if !model.pipelines.isEmpty {
                        VStack(alignment: .trailing) {
                            HStack {
                                DonutChart()
                                Spacer()
                                DashboardMetricsSection(metrics: model.chartData)
                            }
                            .padding(.horizontal, 32)
                        }
                        .padding(.bottom, 44)
                    } else {
                        EmptyStateView(type: .homeGraph)
                            .padding(.bottom, 20)
                    }
                }
                .padding(.top, 16)
                .frame(maxWidth: .infinity)
                .background(Color.backgroundBlue)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        if !model.pipelines.isEmpty {
                            DropdownMenu(selection: $model.pipelines[0], pipelines: model.pipelines)
                                 .padding(.trailing, 16)
                                 .padding(.bottom, 8)
                        }
                    }
                }
                VStack {
                    // Deal and contact data should be fetched on this screen and passed into the child components. Only display the empty state if both sets of data are empty.
                    if !model.pipelines.isEmpty {
                        Spacer()
                        ScrollView(showsIndicators: false) {
                            RecentDealsSection()
                                .padding(.top, 16)
                            RecentContactsSection()
                                .padding(.top, 8)
                        }
                    } else {
                        Spacer()
                        EmptyStateView(type: .homeRecent)
                            .padding(.bottom, 100)
                        Spacer()
                    }
                }
                .frame(maxWidth: .infinity)
                .background(Color.homeBodySectionBlue)
            }
            .navigationTitle("Dashboard")
            .navigationBarBackButtonHidden(true)
        }
        .task {
//            model.loadPipelines { error in
//                if let error, let statusCode = error.responseCode, statusCode == 500 {
//                    // Logout and clear access token for 500 response codes
//                    KeyStorage.shared.set("", forKey: Constants.accessToken)
//                    route = .onboarding(.signIn)
//                }
//            }
        }
    }
}

//struct HomeScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeScreen()
//    }
//}
