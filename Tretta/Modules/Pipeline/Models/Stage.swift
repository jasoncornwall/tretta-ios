//
//  Stage.swift
//  Tretta
//
//  Created by Jason C on 5/4/23.
//

import Foundation

struct Stage: Codable, Hashable, CustomStringConvertible {
    let _id: String
    let name: String
    let pipelineOrderIdx: Int
    let pipelineId: String
    let pipeline: Pipeline
}
