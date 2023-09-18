//
//  CalendarScreenModel.swift
//  Tretta
//
//  Created by Jason C on 9/17/23.
//

import SwiftUI

class CalendarScreenModel: ObservableObject {
//    let defaultStartDate = Date().addingTimeInterval(TimeInterval(60 * 60 * 24 * (-30 * 36)))
//    let defaultEndDate = Date().addingTimeInterval(TimeInterval(60 * 60 * 24 * (30 * 36)))
    
    func requestCalendarAccess() {
        CalendarManager.shared.requestAccess()
    }
    
}
