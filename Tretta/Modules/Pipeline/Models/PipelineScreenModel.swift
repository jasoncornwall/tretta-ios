//
//  PipelineScreenModel.swift
//  Tretta
//
//  Created by Jason C on 5/12/23.
//

import SwiftUI

@MainActor
class PipelineScreenModel: ObservableObject {
    @Published var searchText = ""
    @Published var stageSelection: Int = 0
    @Published var currentPipelineSelection = PipelineMockData.pipelines[0]
    
    @Published var pipelines: [Pipeline] = []
    @Published var stages: [Stage] = []
    @Published var deals: [Deal] = []
    @Published var contacts: [Contact] = []
    
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
    
    func loadStages(pipelineId: String, completion: @escaping EmptyCompletionHandler) {
//        stages = PipelineMockData.stages.filter { $0.pipelineId == pipelineId }
                
        PipelineApiService.getStages(pipelineId: pipelineId) { [weak self] result in
            guard let self else { return }
            switch result {
            case let .success(stages):
                self.stages = stages
                completion()
            case let .failure(error):
                print("Error fetching stages: \(error)")
            }
        }
    }
    
    func loadDeals(pipelineId: String) {
//        deals = PipelineMockData.deals.filter { $0.pipelineId == pipelineId }
        
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
    
    func loadContacts() {
//        let accountId = KeyStorage.shared.getStringValue(forKey: Constants.accountIdKey) ?? ""
        
        ContactApiService.getContacts(accountId: "testuserid") { [weak self] result in
            guard let self else { return }
            
            switch result {
            case let .success(contacts):
                self.contacts = contacts
            case let .failure(error):
                print("Error fetching contacts: \(error)")
            }
        }
    }
    
    func getDealsByStage(_ stageId: String) -> [Deal] {
        return deals.filter { $0.stageId == stageId }
    }
}

