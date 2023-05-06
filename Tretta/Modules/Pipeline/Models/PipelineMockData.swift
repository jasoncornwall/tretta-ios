//
//  PipelineMockData.swift
//  Tretta
//
//  Created by Jason C on 5/4/23.
//

import Foundation

struct PipelineMockData {
    static let pipelines: [Pipeline] = [
        Pipeline(_id: "0", name: "Current Sales"),
        Pipeline(_id: "1", name: "Coffee Shops"),
        Pipeline(_id: "2", name: "Enterprise")
    ]
    
    static let stages: [Stage] = [
        Stage(_id: "1", name: "Qualified", pipelineOrderIdx: 0, pipelineId: "0"),
        Stage(_id: "2", name: "Follow Up", pipelineOrderIdx: 1, pipelineId: "0"),
        Stage(_id: "3", name: "In Progress", pipelineOrderIdx: 2, pipelineId: "0"),
        Stage(_id: "4", name: "Closed", pipelineOrderIdx: 3, pipelineId: "0"),
        Stage(_id: "5", name: "Old Shops", pipelineOrderIdx: 0, pipelineId: "1"),
        Stage(_id: "6", name: "New Shops", pipelineOrderIdx: 1, pipelineId: "1"),
        Stage(_id: "7", name: "Local Shops", pipelineOrderIdx: 2, pipelineId: "1"),
        Stage(_id: "8", name: "National Shops", pipelineOrderIdx: 3, pipelineId: "1"),
        Stage(_id: "9", name: "International Shops", pipelineOrderIdx: 4, pipelineId: "1"),
        Stage(_id: "10", name: "Franchise Shops", pipelineOrderIdx: 5, pipelineId: "1"),
        Stage(_id: "11", name: "Meta", pipelineOrderIdx: 0, pipelineId: "2"),
        Stage(_id: "12", name: "Google", pipelineOrderIdx: 1, pipelineId: "2"),
        Stage(_id: "13", name: "Microsoft", pipelineOrderIdx: 2, pipelineId: "2"),
        Stage(_id: "14", name: "Snap", pipelineOrderIdx: 3, pipelineId: "2"),
    ]
    
    static let deals: [Deal] = [
        Deal(_id: "1", name: "Villa Coworking Space", creatorUserId: "1", stageId: "1", contactId: "1", value: 1000, customerCount: 1, creationDate: "\(Date().description)", pipelineId: "0"),
        Deal(_id: "2", name: "Edgars Smoke Shop", creatorUserId: "1", stageId: "1", contactId: "1", value: 1000, customerCount: 1, creationDate: "\(Date().description)", pipelineId: "0"),
        Deal(_id: "3", name: "Hofstra Digital Agency", creatorUserId: "1", stageId: "2", contactId: "1", value: 1000, customerCount: 1, creationDate: "\(Date().description)", pipelineId: "0"),
        Deal(_id: "4", name: "Turkish Doner Shop", creatorUserId: "1", stageId: "3", contactId: "1", value: 1000, customerCount: 1, creationDate: "\(Date().description)", pipelineId: "0"),
        Deal(_id: "5", name: "Downtown Vegan bakery", creatorUserId: "1", stageId: "3", contactId: "1", value: 1000, customerCount: 1, creationDate: "\(Date().description)", pipelineId: "0"),
        Deal(_id: "6", name: "Thrift Shop", creatorUserId: "1", stageId: "3", contactId: "1", value: 1000, customerCount: 1, creationDate: "\(Date().description)", pipelineId: "0"),
        Deal(_id: "7", name: "Boutique Clothing Store", creatorUserId: "1", stageId: "4", contactId: "1", value: 1000, customerCount: 1, creationDate: "\(Date().description)", pipelineId: "0"),
        Deal(_id: "8", name: "Pocket Watch Shop", creatorUserId: "1", stageId: "5", contactId: "1", value: 1000, customerCount: 1, creationDate: "\(Date().description)", pipelineId: "0"),
        Deal(_id: "9", name: "Local French Press", creatorUserId: "1", stageId: "5", contactId: "1", value: 1000, customerCount: 1, creationDate: "\(Date().description)", pipelineId: "1"),
        Deal(_id: "10", name: "Local Cold Drip", creatorUserId: "1", stageId: "6", contactId: "1", value: 1000, customerCount: 1, creationDate: "\(Date().description)", pipelineId: "1"),
        Deal(_id: "11", name: "Nitro Brew Shop", creatorUserId: "1", stageId: "6", contactId: "1", value: 1000, customerCount: 1, creationDate: "\(Date().description)", pipelineId: "1"),
        Deal(_id: "12", name: "Fine Roasted Beans", creatorUserId: "1", stageId: "7", contactId: "1", value: 1000, customerCount: 1, creationDate: "\(Date().description)", pipelineId: "1"),
        Deal(_id: "13", name: "Fair Trade Coffee", creatorUserId: "1", stageId: "7", contactId: "1", value: 1000, customerCount: 1, creationDate: "\(Date().description)", pipelineId: "1"),
        Deal(_id: "14", name: "Downtown Cup o Joe", creatorUserId: "1", stageId: "7", contactId: "1", value: 1000, customerCount: 1, creationDate: "\(Date().description)", pipelineId: "1"),
        Deal(_id: "15", name: "Caffeine Shop", creatorUserId: "1", stageId: "8", contactId: "1", value: 1000, customerCount: 1, creationDate: "\(Date().description)", pipelineId: "1"),
        Deal(_id: "16", name: "Ground On The Spot Shop", creatorUserId: "1", stageId: "9", contactId: "1", value: 1000, customerCount: 1, creationDate: "\(Date().description)", pipelineId: "1"),
        Deal(_id: "17", name: "Elite Roasters Club", creatorUserId: "1", stageId: "10", contactId: "1", value: 1000, customerCount: 1, creationDate: "\(Date().description)", pipelineId: "1"),
        Deal(_id: "18", name: "The Metaverse", creatorUserId: "1", stageId: "11", contactId: "1", value: 1000, customerCount: 1, creationDate: "\(Date().description)", pipelineId: "2"),
        Deal(_id: "19", name: "Snap AI integration", creatorUserId: "1", stageId: "12", contactId: "1", value: 1000, customerCount: 1, creationDate: "\(Date().description)", pipelineId: "2"),
        Deal(_id: "20", name: "Gmail", creatorUserId: "1", stageId: "12", contactId: "1", value: 1000, customerCount: 1, creationDate: "\(Date().description)", pipelineId: "2"),
        Deal(_id: "21", name: "Google Docs", creatorUserId: "1", stageId: "13", contactId: "1", value: 1000, customerCount: 1, creationDate: "\(Date().description)", pipelineId: "2"),
        Deal(_id: "23", name: "Insta Stories", creatorUserId: "1", stageId: "13", contactId: "1", value: 1000, customerCount: 1, creationDate: "\(Date().description)", pipelineId: "2"),
        Deal(_id: "24", name: "Whatsapp Groups", creatorUserId: "1", stageId: "14", contactId: "1", value: 1000, customerCount: 1, creationDate: "\(Date().description)", pipelineId: "2"),
        Deal(_id: "25", name: "Microsoft ChatGPT Support", creatorUserId: "1", stageId: "15", contactId: "1", value: 1000, customerCount: 1, creationDate: "\(Date().description)", pipelineId: "2")
    ]
}
