//
//  EventListView.swift
//  Tretta
//
//  Created by Jason C on 9/18/23.
//

import EventKit
import SwiftUI

struct EventListView: View {
    @State private var selectedEvent: EKEvent?
    
    let events: [EKEvent]
    
    init(events: [EKEvent]) {
        self.events = events
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                ForEach(events, id: \.calendarItemExternalIdentifier) { event in
                    EventCell(event: event)
                        .onTapGesture {
                            selectedEvent = event
                        }
                }
            }
            .padding(.bottom, 24)
            .sheet(item: $selectedEvent, content: { event in
                EventEditView(eventStore: CalendarManager.shared.eventStore, event: event)
            })
        }
    }
    
}

extension EKEvent: Identifiable {
    
}
