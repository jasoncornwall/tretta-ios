//
//  PipelineSheet.swift
//  Tretta
//
//  Created by Jason C on 9/21/23.
//

import Foundation

enum PipelineSheet: Hashable, Identifiable {
    var id: Self {
        return self
    }
    
    case createPipeline
    case createDeal
    case viewDeal(deal: Deal, stageName: String)
}
