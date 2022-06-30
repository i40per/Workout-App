//
//  Date + Extensions.swift
//  Workout App
//
//  Created by MacBook on 29.06.2022.
//

import Foundation

extension Date {
    
    func getWeekdayNumber() -> Int {
        let calendar = Calendar.current
        let weekday = calendar.component(.weekday, from: self)
        return weekday
    }
}
