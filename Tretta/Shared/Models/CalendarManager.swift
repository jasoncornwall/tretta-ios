//
//  CalendarManager.swift
//  Tretta
//
//  Created by Jason C on 9/18/23.
//

import Combine
import EventKit
import Foundation

class CalendarManager {
    static let shared = CalendarManager()
    private init() {}
    
    var eventStore = EKEventStore()
    var events: [EKEvent]?
    var cancellables = Set<AnyCancellable>()
    
    func requestAccess() {
        eventStore.requestAccess(to: .event) { [weak self] accessGranted, error in
            guard let self else { return }
                        
            if accessGranted {
                DispatchQueue.main.async {
                    self.loadEvents()
                    self.subscribeToCalendarUpdates()
                }
            }
        }
    }
    
    func loadEvents() {
        let predicate = eventStore.predicateForEvents(
            withStart: .daysFromToday(-30*36),
            end: .daysFromToday(30*36),
            calendars: nil
        )
        events = eventStore.events(matching: predicate).sorted { $0.startDate < $1.startDate }
    }
    
    func subscribeToCalendarUpdates() {
        NotificationCenter.default.publisher(for: .EKEventStoreChanged)
            .sink { _ in
                // Reload calendar events after external update.
                DispatchQueue.main.async {
                    self.loadEvents()
                }
            }
            .store(in: &cancellables)
    }
}
