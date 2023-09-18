//
//  PipelineApiService.swift
//  Tretta
//
//  Created by Jason C on 9/14/23.
//

import Alamofire
import Foundation

typealias GetPipelinesCompletionHandler = (Result<[Pipeline], AFError>) -> Void
typealias CreatePipelineCompletionHandler = (Result<Pipeline, AFError>) -> Void
typealias GetStagesCompletionHandler = (Result<[Stage], AFError>) -> Void
typealias CreateStageCompletionHandler = (Result<Stage, AFError>) -> Void
typealias GetDealsCompletionHandler = (Result<[Deal], AFError>) -> Void
typealias CreateDealCompletionHandler = (Result<Deal, AFError>) -> Void

class PipelineApiService {
    
    private static let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
    
    static func getPipelines(accountId: String, completion: @escaping GetPipelinesCompletionHandler) {
        AF.request(PipelineApiRouter.getPipelines(accountId: accountId))
            .responseDecodable(of: [Pipeline].self, decoder: decoder) { response in
                completion(response.result)
            }
    }
    
    static func createPipeline(pipeline: Pipeline, completion: @escaping CreatePipelineCompletionHandler) {
        AF.request(PipelineApiRouter.createPipeline(pipeline: pipeline))
            .responseDecodable(of: Pipeline.self, decoder: decoder) { response in
                completion(response.result)
            }
    }
    
    static func getStages(pipelineId: String, completion: @escaping GetStagesCompletionHandler) {
        AF.request(PipelineApiRouter.getStages(pipelineId: pipelineId))
            .responseDecodable(of: [Stage].self, decoder: decoder) { response in
                completion(response.result)
            }
    }
    
    static func createStage(stage: Stage, completion: @escaping CreateStageCompletionHandler) {
        AF.request(PipelineApiRouter.createStage(stage: stage))
            .responseDecodable(of: Stage.self, decoder: decoder) { response in
                completion(response.result)
            }
    }
    
    static func getDeals(pipelineId: String, completion: @escaping GetDealsCompletionHandler) {
        AF.request(PipelineApiRouter.getDeals(pipelineId: pipelineId))
            .responseDecodable(of: [Deal].self, decoder: decoder) { response in
                completion(response.result)
            }
    }
    
    static func createDeal(deal: Deal, completion: @escaping CreateDealCompletionHandler) {
        AF.request(PipelineApiRouter.createDeal(deal: deal))
            .responseDecodable(of: Deal.self, decoder: decoder) { response in
                completion(response.result)
            }
    }
    
}
