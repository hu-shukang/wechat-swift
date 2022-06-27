//
//  DateUtil.swift
//  WeChat
//
//  Created by 胡书康 on 2022/06/26.
//

import Foundation

class DateUtil {
    private let calendar = Calendar.current
    private let formatter = DateFormatter()
    public static let instance: DateUtil = DateUtil();
    
    init() {
        formatter.locale = Locale(identifier: "ja_JP")
    }
    
    func unixToDate(unix: Int) -> Date {
        return Date(timeIntervalSince1970: TimeInterval(unix))
    }
    
    func isToday(date: Date) -> Bool {
        return self.calendar.isDateInToday(date)
    }
    
    func isToday(unix: Int) -> Bool {
        let date = self.unixToDate(unix: unix)
        return self.isToday(date: date)
    }
    
    func isYesterday(date: Date) -> Bool {
        return self.calendar.isDateInYesterday(date)
    }
    
    func isYesterday(unix: Int) -> Bool {
        let date = self.unixToDate(unix: unix)
        return self.calendar.isDateInYesterday(date)
    }
    
    func startOfWeek(date: Date) -> Date {
        return calendar.dateComponents([.calendar, .yearForWeekOfYear, .weekOfYear], from: date).date!
    }
    
    func endOfWeek(date: Date) -> Date {
        let startOfWeek = calendar.dateComponents([.calendar, .yearForWeekOfYear, .weekOfYear], from: date).date!
        let startOfNextWeek = calendar.date(byAdding: .day, value: 7, to: startOfWeek)!
        return calendar.date(byAdding: .second, value: -1, to: startOfNextWeek)!
    }
    
    func endOfWeek(startOfWeek: Date) -> Date {
        let startOfNextWeek = calendar.date(byAdding: .day, value: 7, to: startOfWeek)!
        return calendar.date(byAdding: .second, value: -1, to: startOfNextWeek)!
    }
    
    func formatToHHmm(date: Date) -> String {
        formatter.dateFormat = "HH:mm"
        return formatter.string(from: date)
    }
    
    func formatToMMDD(date: Date) -> String {
        formatter.dateFormat = "MM月dd日"
        return formatter.string(from: date)
    }
    
    func getWeek(date: Date) -> String {
        formatter.dateFormat = "EEEE"
        return formatter.string(from: date)
    }
    
    func formatTime(unix: Int) -> String {
        let date = self.unixToDate(unix: unix)
        if self.isToday(date: date) {
            return self.formatToHHmm(date: date)
        } else if self.isYesterday(date: date) {
            return "昨日 " + self.formatToHHmm(date: date)
        } else if (date > self.startOfWeek(date: date)) {
            return self.getWeek(date: date)
        }
        return self.formatToMMDD(date: date)
    }
}

