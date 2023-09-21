//
//  CalendarScreen.swift
//  Tretta
//
//  Created by Jason C on 9/17/23.
//

import ElegantCalendar
import SwiftUI

struct CalendarScreen: View {
    @Binding var route: Route
    @StateObject var model: CalendarScreenModel
    
    @ObservedObject var calendarManager = {
        ElegantCalendarManager(
            configuration: CalendarConfiguration(
                startDate: .daysFromToday(-30*36),
                endDate: .daysFromToday(30*36)
            )
            , initialMonth: Date()
        )
    }()
    
    var body: some View {
        NavigationStack {
            ElegantCalendarView(calendarManager: calendarManager)
                .theme(CalendarTheme(
                    primary: .backgroundBlue,
                    titleColor: .trettaGold,
                    textColor: .white,
                    todayTextColor: .white,
                    todayBackgroundColor: Color.backgroundBlue.opacity(0.3)
                ))
        }
        .task {
            calendarManager.datasource = self
            model.requestCalendarAccess()
        }
    }
}

extension CalendarScreen: ElegantCalendarDataSource {
    
    func calendar(viewForSelectedDate date: Date, dimensions size: CGSize) -> AnyView {
        let startOfDay = Calendar.current.startOfDay(for: date)
        return EventListView(events: model.visitsByDay[startOfDay] ?? []).erased
    }
    
}
