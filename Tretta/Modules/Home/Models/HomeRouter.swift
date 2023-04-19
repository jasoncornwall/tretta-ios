//
//  HomeRouter.swift
//  Tretta
//
//  Created by Jason C on 4/19/23.
//

import SwiftUI

struct HomeRouter {
    let route: Route.HomeRoute
    
    @ViewBuilder
    func setup() -> some View {
        switch route {
        case .main:
            HomeScreen()
        }
    }
}
