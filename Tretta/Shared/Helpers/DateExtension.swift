//
//  DateExtension.swift
//  Tretta
//
//  Created by Jason C on 9/19/23.
//

import Foundation

extension Date {
    
    static func daysFromToday(_ days: Int) -> Date {
        Date().addingTimeInterval(TimeInterval(60*60*24*days))
    }
    
}
