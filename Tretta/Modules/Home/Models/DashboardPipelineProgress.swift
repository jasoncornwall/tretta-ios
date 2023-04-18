//
//  DashboardPipelineProgress.swift
//  Tretta
//
//  Created by Jason C on 4/14/23.
//

import SwiftUI

struct DashboardPipelineProgress: Hashable {
    let stageName: String
    let stageColor: Color
    let percentage: CGFloat
    var value: CGFloat
}
