//
//  ContactRouter.swift
//  Tretta
//
//  Created by Jason C on 4/19/23.
//

import SwiftUI

struct ContactRouter {
    @Binding var route: Route
    let model: ContactScreenModel
    
    @ViewBuilder
    func setup() -> some View {
        switch route {
        case .contact(.main):
            ContactScreen(route: $route, model: model)
        case .contact(let .detail(contact)):
            ContactDetailScreen(contact: contact)
        default:
            ContactScreen(route: $route, model: model)
        }
    }
}
