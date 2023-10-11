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
    @Published var deals: [Deal] = []
    
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
    
    func loadDeals(pipelineId: String) {
        PipelineApiService.getDeals(pipelineId: pipelineId) { [weak self] result in
            guard let self else { return }
            
            switch result {
            case let .success(deals):
                self.deals = deals
            case let .failure(error):
                print("Error fetching deals: \(error)")
            }
        }
    }
}
