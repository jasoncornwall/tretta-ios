//
//  HomeScreenModel.swift
//  Tretta
//
//  Created by Jason C on 7/20/23.
//

import SwiftUI

@MainActor
class HomeScreenModel: ObservableObject {
    @Published var pipelines: [Pipeline] = []
    
    var chartData =
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
    
    func loadPipelines() {
        pipelines = PipelineMockData.pipelines
    }
}
