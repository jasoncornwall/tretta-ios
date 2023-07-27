//
//  NavigationState.swift
//  Tretta
//
//  Created by Jason C on 4/12/23.
//

import SwiftUI

@MainActor
class NavigationState: ObservableObject {
    @Published var routes: [Route] = []
}
