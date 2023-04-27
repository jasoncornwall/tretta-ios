//
//  HomeScreen.swift
//  Tretta
//
//  Created by Jason C on 4/14/23.
//

import SwiftUI

struct HomeScreen: View {
//    @EnvironmentObject private var navigationState: NavigationState
    
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
                    VStack(alignment: .trailing) {
                       DropdownMenu(selection: "")
                            .padding(.trailing, 16)
                            .padding(.bottom, 8)
                        HStack {
                            DonutChart()
                            Spacer()
                            DashboardMetricsSection(metrics: chartData)
                        }
                        .padding(.horizontal, 32)
                    }
                    .padding(.bottom, 44)
                }
                .padding(.top, 16)
                .frame(maxWidth: .infinity)
                .background(Color.backgroundBlue)
                VStack {
                    Spacer()
                    ScrollView(showsIndicators: false) {
                        RecentDealsSection()
                            .padding(.top, 16)
                        RecentContactsSection()
                            .padding(.top, 8)
                    }
                }
                .frame(maxWidth: .infinity)
                .background(Color.homeBodySectionBlue)
            }
            .navigationTitle("Dashboard")
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
