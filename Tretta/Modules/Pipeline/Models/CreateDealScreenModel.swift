//
//  CreateDealScreenModel.swift
//  Tretta
//
//  Created by Jason C on 9/26/23.
//

import SwiftUI

@MainActor
class CreateDealScreenModel: ObservableObject {
    let pipelineId: String
    let contacts: [Contact]
    let stages: [Stage]
    
    init(pipelineId: String, contacts: [Contact], stages: [Stage]) {
        self.pipelineId = pipelineId
        self.contacts = contacts
        self.stages = stages
    }
    
    func createDeal(name: String, stageId: String, contactId: String, value: String, completion: @escaping CreateDealCompletionHandler) {
        guard let accountId = KeyStorage.shared.getStringValue(forKey: Constants.accountIdKey) else {
            return
        }
        
        let deal = Deal(
            _id: "",
            name: name,
            creatorUserId: accountId,
            stageId: stageId,
            contactId: contactId,
            value: Int(value) ?? 0,
            customerCount: nil,
            creationDate: Date.now,
            pipelineId: self.pipelineId
        )
                
        PipelineApiService.createDeal(deal: deal, completion: completion)
    }
}
