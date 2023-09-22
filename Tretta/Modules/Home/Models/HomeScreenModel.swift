//
//  HomeScreenModel.swift
//  Tretta
//
//  Created by Jason C on 7/20/23.
//

import SwiftUI

@MainActor
class HomeScreenModel: ObservableObject {
    @Published var currentPipelineSelection = PipelineMockData.pipelines[0]
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
    
    func loadPipelines(completion: @escaping ErrorCompletionHandler) {
        let accountId = KeyStorage.shared.getStringValue(forKey: Constants.accountIdKey) ?? ""
        
        PipelineApiService.getPipelines(accountId: accountId) { [weak self] result in
            guard let self else { return }
            
            switch result {
            case let .success(pipelines):
                if !pipelines.isEmpty {
                    currentPipelineSelection = pipelines[0]
                }
                self.pipelines = pipelines
                completion(nil)
            case let .failure(error):
                completion(error)
            }
        }
    }
}
