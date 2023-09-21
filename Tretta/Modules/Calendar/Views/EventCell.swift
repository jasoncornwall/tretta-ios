//
//  EventCell.swift
//  Tretta
//
//  Created by Jason C on 9/18/23.
//

import SwiftUI
import EventKit

struct EventCell: View {
    
    let event: EKEvent
    
    private var dateFormatter: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm a"
        return dateFormatter
    }
    
    private var eventStartDate: String {
        return dateFormatter.string(from: event.startDate)
    }
    
    private var eventEndDate: String {
        return dateFormatter.string(from: event.endDate)
    }
    
    var body: some View {
        HStack {
            Rectangle()
                .frame(width: 8, height: 44)
                .foregroundColor(Color(event.calendar.cgColor))
                .cornerRadius(8)
            VStack(alignment: .leading, spacing: 2) {
                Text("\(event.title)")
                    .font(.system(size: 18, weight: .regular))
                if event.isAllDay {
                    Text("All-Day")
                        .font(.system(size: 13, weight: .regular))
                } else {
                    Text("\(eventStartDate) - \(eventEndDate)")
                        .font(.system(size: 13, weight: .regular))
                }
            }
        }
    }
    
}
