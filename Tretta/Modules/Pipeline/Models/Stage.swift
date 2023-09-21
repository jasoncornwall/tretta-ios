//
//  Stage.swift
//  Tretta
//
//  Created by Jason C on 5/4/23.
//

import Foundation

struct Stage: Codable, Hashable, CustomStringConvertible, Identifiable {
    var _id: String?
    var name: String
    var pipelineOrderIdx: Int
    var pipelineId: String
    
    var id: String { self._id ?? name }
}

extension Stage {
    
    init(id: String? = nil, name: String, pipelineOrderIdx: Int, pipelineId: String) {
        self._id = id
        self.name = name
        self.pipelineOrderIdx = pipelineOrderIdx
        self.pipelineId = pipelineId
    }
    
}
