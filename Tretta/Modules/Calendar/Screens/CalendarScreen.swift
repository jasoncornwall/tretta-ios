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
    
    @ObservedObject var calendarManager = ElegantCalendarManager(
        configuration: CalendarConfiguration(
            startDate: Date().addingTimeInterval(TimeInterval(60 * 60 * 24 * (-30 * 36))),
            endDate: Date().addingTimeInterval(TimeInterval(60 * 60 * 24 * (30 * 36)))
        )
        , initialMonth: Date()
    )
    
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
            calendarManager.delegate = self
            model.requestCalendarAccess()
        }
    }
}

extension CalendarScreen: ElegantCalendarDelegate {
    
    func calendar(didSelectDay date: Date) {
        print("Selected date: \(date)")
    }

    func calendar(willDisplayMonth date: Date) {
        print("Month displayed: \(date)")
    }

    func calendar(didSelectMonth date: Date) {
        print("Selected month: \(date)")
    }

    func calendar(willDisplayYear date: Date) {
        print("Year displayed: \(date)")
    }
    
}
