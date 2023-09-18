//
//  CalendarScreen.swift
//  Tretta
//
//  Created by Jason C on 9/17/23.
//

import SwiftUI

struct CalendarScreen: View {
    @Binding var route: Route
    @StateObject var model: CalendarScreenModel
    
    var body: some View {
        NavigationStack {
            Text("Calendar")
        }
        .task {
            model.requestCalendarAccess()
        }
    }
}
