//
//  PipelineScreenModel.swift
//  Tretta
//
//  Created by Jason C on 5/12/23.
//

import SwiftUI

@MainActor
class PipelineScreenModel: ObservableObject {
    @Published var pipelines: [Pipeline] = []
    @Published var stages: [Stage] = []
    @Published var deals: [Deal] = []
    
    func loadPipelines() {
        pipelines = PipelineMockData.pipelines
    }
    
    func loadStages(pipelineId: String) {
        stages = PipelineMockData.stages.filter { $0.pipelineId == pipelineId }
    }
    
    func loadDeals(pipelineId: String) {
        deals = PipelineMockData.deals.filter { $0.pipelineId == pipelineId }
    }
    
    func getDealsByStage(_ stageId: String) -> [Deal] {
        return deals.filter { $0.stageId == stageId }
    }
}

