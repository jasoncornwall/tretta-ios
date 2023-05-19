//
//  PipelineRouter.swift
//  Tretta
//
//  Created by Jason C on 5/19/23.
//

import SwiftUI


struct PipelineRouter {
    @Binding var route: Route
    let model: PipelineScreenModel
    
    @ViewBuilder
    func setup() -> some View {
        switch route {
        case .pipeline(.main):
            PipelineScreen(route: $route, model: model)
        case .pipeline(let .detail(deal)):
            Text("\(deal.name)")
        default:
            PipelineScreen(route: $route, model: model)
        }
    }
}
