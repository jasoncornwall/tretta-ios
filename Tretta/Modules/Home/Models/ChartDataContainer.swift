//
//  ChartDataContainer.swift
//  Tretta
//
//  Created by Jason C on 4/17/23.
//

import SwiftUI

@MainActor
class ChartDataContainer : ObservableObject {
    @Published var chartData =
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
    
    func calc() {
        var value : CGFloat = 0
        
        for i in 0..<chartData.count {
            value += chartData[i].percentage
            chartData[i].value = value
        }
    }
}
