//
//  HomeRouter.swift
//  Tretta
//
//  Created by Jason C on 4/19/23.
//

import SwiftUI

struct HomeRouter {
    @Binding var route: Route
    let model: HomeScreenModel
    
    @ViewBuilder
    func setup() -> some View {
        switch route {
        case .home(.main):
            HomeScreen(route: $route, model: model)
        default:
            HomeScreen(route: $route, model: model)
        }
    }
}
