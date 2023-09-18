//
//  CalendarRouter.swift
//  Tretta
//
//  Created by Jason C on 9/18/23.
//

import SwiftUI

struct CalendarRouter {
    @Binding var route: Route
    let model: CalendarScreenModel
    
    @ViewBuilder
    func setup() -> some View {
        switch route {
        case .calendar(.main):
            CalendarScreen(route: $route, model: model)
        default:
            CalendarScreen(route: $route, model: model)
        }
    }
}
