//
//  HomeScreen.swift
//  Tretta
//
//  Created by Jason C on 4/14/23.
//

import SwiftUI

struct HomeScreen: View {
//    @EnvironmentObject private var navigationState: NavigationState
    
    @State private var pipelines = PipelineMockData.pipelines
    @State private var currentPipelineSelection = PipelineMockData.pipelines[0]
    
    private var chartData =
        [
            DashboardPipelineProgress(
            stageName: "Done",
            stageColor: .graphLightBlue,
            percentage: 0.41,
            value: 0
            ),
            DashboardPipelineProgress(
             stageName: "Pending",
             stageColor: .graphYellow,
             percentage: 0.25,
             value: 0
            ),
            DashboardPipelineProgress(
                stageName: "Todo",
                stageColor: .graphGreen,
                percentage: 0.34,
                value: 0
            )
        ]
    
    var body: some View {
        NavigationStack {
            Group {
                VStack {
                    if !pipelines.isEmpty {
                        VStack(alignment: .trailing) {
                            HStack {
                                DonutChart()
                                Spacer()
                                DashboardMetricsSection(metrics: chartData)
                            }
                            .padding(.horizontal, 32)
                        }
                        .padding(.bottom, 44)
                    } else {
                        EmptyStateView()
                            .padding(.bottom, 20)
                    }
                }
                .padding(.top, 16)
                .frame(maxWidth: .infinity)
                .background(Color.backgroundBlue)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        if !pipelines.isEmpty {
                            DropdownMenu(selection: $currentPipelineSelection, pipelines: pipelines)
                                 .padding(.trailing, 16)
                                 .padding(.bottom, 8)
                        }
                    }
                }
                VStack {
                    // Deal and contact data should be fetched on this screen and passed into the child components. Only display the empty state if both sets of data are empty.
                    if !pipelines.isEmpty {
                        Spacer()
                        ScrollView(showsIndicators: false) {
                            RecentDealsSection()
                                .padding(.top, 16)
                            RecentContactsSection()
                                .padding(.top, 8)
                        }
                    } else {
                        Spacer()
                        EmptyStateView()
                        Spacer()
                    }
                }
                .frame(maxWidth: .infinity)
                .background(Color.homeBodySectionBlue)
            }
            .navigationTitle("Dashboard")
            .navigationBarBackButtonHidden(true)
        }
    }
}

//struct HomeScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeScreen()
//    }
//}
