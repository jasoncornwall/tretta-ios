//
//  PipelineApiRouter.swift
//  Tretta
//
//  Created by Jason C on 9/13/23.
//

import Alamofire
import Foundation

enum PipelineApiRouter: URLRequestConvertible {
    case getPipelines(accountId: String)
    case createPipeline(pipeline: Pipeline)
    case getStages(pipelineId: String)
    case createStage(stage: Stage)
    case getDeals(pipelineId: String)
    case createDeal(deal: Deal)
    
    var method: HTTPMethod {
        switch self {
        case .getPipelines, .getStages, .getDeals:
            return .get
        case .createPipeline, .createStage, .createDeal:
            return .post
        }
    }
    
    var path: String {
        switch self {
        case let .getPipelines(accountId):
            return "pipelines/users/\(accountId)"
        case .createPipeline:
            return "pipelines"
        case let .getStages(pipelineId):
            return "stages/pipelines/\(pipelineId)"
        case .createStage:
            return "stages"
        case let .getDeals(pipelineId):
            return "deals/pipelines/\(pipelineId)"
        case .createDeal:
            return "deals"
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = Constants.baseURL.appendingPathComponent(path)
        var request = URLRequest(url: url)
        request.method = method
        
        var params: [String: String] = [:]
        
        switch self {
        case .getPipelines, .getStages, .getDeals:
            break
        case let .createPipeline(pipeline):
            params = [
                "name": pipeline.name,
                "user_id": pipeline.userId
            ]
        case let .createStage(stage):
            params = [
                "name": stage.name,
                "pipeline_order_idx": "\(stage.pipelineOrderIdx)",
                "pipeline_id": stage.pipelineId
            ]
        case let .createDeal(deal):
            params = [
                "name": deal.name,
                "creator_user_id": deal.creatorUserId,
                "stage_id": deal.stageId ?? "",
                "contact_id": deal.contactId ?? "",
                "pipeline_id": deal.pipelineId ?? "",
                "creation_date": "\(Date.now)",
                "value": "\(deal.value)"
            ]
        }
        
        switch self {
        case .getPipelines, .getStages, .getDeals:
            break
        case .createPipeline, .createStage, .createDeal:
            do {
                request.httpBody = try JSONEncoder().encode(params)
            } catch {
                print(error)
            }
        }
        
        let accessToken = KeyStorage.shared.getStringValue(forKey: Constants.accessToken) ?? ""
        
        request.headers.add(.contentType(Constants.jsonContentType))
        request.headers.add(.authorization(bearerToken: accessToken))
                        
        return request
    }
}
