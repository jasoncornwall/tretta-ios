//
//  Deal.swift
//  Tretta
//
//  Created by Jason C on 5/4/23.
//

import Foundation

struct Deal: Codable, Hashable, CustomStringConvertible, Identifiable {
    var id: String? { _id }
    let _id: String
    let name: String
    let creatorUserId: String
    let stageId: String?
    let contactId: String?
    let value: Int
    let customerCount: Int?
    let creationDate: String
    let pipelineId: String?
}
