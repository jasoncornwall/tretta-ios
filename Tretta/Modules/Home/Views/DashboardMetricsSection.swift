//
//  DashboardMetricsSection.swift
//  Tretta
//
//  Created by Jason C on 4/15/23.
//

import SwiftUI

struct DashboardMetricsSection: View {
    let metrics: [DashboardPipelineProgress]
    
    var body: some View {
        VStack {
            ForEach(metrics, id: \.self) {
                DashboardProgressSection(progress: $0)
            }
        }
    }
}

struct DashboardMetricsSection_Previews: PreviewProvider {
    
    static var previews: some View {
        let metric1 = DashboardPipelineProgress(
            stageName: "Done",
            stageColor: .red,
            percentage: 0.41,
            value: 0
        )
        
        let metric2 = DashboardPipelineProgress(
            stageName: "Pending",
            stageColor: .blue,
            percentage: 0.23,
            value: 0
        )
        
        let metric3 = DashboardPipelineProgress(
            stageName: "Todo",
            stageColor: .green,
            percentage: 0.34,
            value: 0
        )
        
        let metrics = [metric1, metric2, metric3]
        
        DashboardMetricsSection(metrics: metrics)
    }
}
