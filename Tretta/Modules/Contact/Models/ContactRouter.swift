//
//  ContactRouter.swift
//  Tretta
//
//  Created by Jason C on 4/19/23.
//

import SwiftUI

struct ContactRouter {
    @Binding var route: Route
    
    @ViewBuilder
    func setup() -> some View {
        switch route {
        case .contact(.main):
            ContactScreen(route: $route)
        case .contact(.detail):
            Text("Contact Detail View")
        default:
            ContactScreen(route: $route)
        }
    }
}
