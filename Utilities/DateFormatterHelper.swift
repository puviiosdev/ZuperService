//
//  DateFormatterHelper.swift
//  ZuperService
//
//  Created by puvi on 12/03/26.
//
import SwiftUI

struct DateFormatterHelper {

    static func formatDate(_ isoDate: String) -> String {

        let isoFormatter = ISO8601DateFormatter()

        guard let date = isoFormatter.date(from: isoDate) else {
            return isoDate
        }

        let calendar = Calendar.current

        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "h:mm a"

        if calendar.isDateInToday(date) {
            return "Today, \(timeFormatter.string(from: date))"
        }

        if calendar.isDateInTomorrow(date) {
            return "Tomorrow, \(timeFormatter.string(from: date))"
        }

        if calendar.isDateInYesterday(date) {
            return "Yesterday, \(timeFormatter.string(from: date))"
        }

        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy, h:mm a"

        return formatter.string(from: date)
    }
}
