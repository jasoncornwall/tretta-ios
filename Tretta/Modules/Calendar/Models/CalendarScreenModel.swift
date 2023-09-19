//
//  CalendarScreenModel.swift
//  Tretta
//
//  Created by Jason C on 9/17/23.
//

import EventKit
import SwiftUI

class CalendarScreenModel: ObservableObject {
    var visitsByDay: [Date: [EKEvent]] {
        Dictionary(grouping: CalendarManager.shared.events ?? [], by: { Calendar.current.startOfDay(for: $0.startDate) })
    }
    
    func requestCalendarAccess() {
        CalendarManager.shared.requestAccess()
    }
    
}
