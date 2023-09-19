//
//  EventListView.swift
//  Tretta
//
//  Created by Jason C on 9/18/23.
//

import EventKit
import SwiftUI

struct EventListView: View {
    
    let events: [EKEvent]
    
    init(events: [EKEvent]) {
        self.events = events
    }
    
    var body: some View {
        VStack {
            ForEach(events, id: \.calendarItemExternalIdentifier) { event in
                EventCell(event: event)
            }
        }
    }
    
}
