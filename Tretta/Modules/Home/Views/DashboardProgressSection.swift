//
//  DashboardProgressSection.swift
//  Tretta
//
//  Created by Jason C on 4/15/23.
//

import SwiftUI

struct DashboardProgressSection: View {
    let progress: DashboardPipelineProgress
    
    var body: some View {
        HStack {
            Circle()
                .frame(width: 10, height: 10)
                .padding(.trailing, 4)
            VStack(alignment: .leading) {
                Text("\(Int(progress.percentage * 100))%")
                    .font(.system(size: 28, weight: .bold))
                Text("\(progress.stageName)")
                    .font(.system(size: 14, weight: .semibold))
            }
        }
    }
}

struct DashboardProgressSection_Previews: PreviewProvider {
    static var previews: some View {
        DashboardProgressSection(progress: DashboardPipelineProgress(
            stageName: "Done",
            stageColor: .red,
            percentage: 0.41)
        )
    }
}
