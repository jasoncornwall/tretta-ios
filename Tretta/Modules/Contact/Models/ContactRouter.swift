//
//  ContactRouter.swift
//  Tretta
//
//  Created by Jason C on 4/19/23.
//

import SwiftUI

struct ContactRouter {
    let route: Route.ContactRoute
    
    @ViewBuilder
    func setup() -> some View {
        switch route {
        case .main:
            ContactScreen()
        case .detail:
            Text("Contact Detail View")
        }
    }
}
