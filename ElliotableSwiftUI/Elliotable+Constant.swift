//
//  Elliotable+Constant.swift
//  ElliotableSwiftUI
//
//  Created by Denny on 2020/09/15.
//

import Foundation

public class ElliotableConstant {
    public static let shared: ElliotableConstant = ElliotableConstant()
    
    private var courseList: [ElliottEvent] = [ElliottEvent]() {
        didSet {
            self.minTime = getMinHour()
            self.maxTime = getMaxHour()
        }
    }
    
    private var daySymbols: [String] = ["월", "화", "수", "목", "금", "토", "일"]
    private var isPadding: Bool = false
    private var minTime: Int = 9
    private var maxTime: Int = 20
    private var dayCount: Int = 5
    
    private init() { }
    
    public func setDayCount(count: Int) {
        self.dayCount = count
    }
    
    public func setCourseList(list: [ElliottEvent]) {
        self.courseList = list
    }
    
    public func setMinTime(minTime: Int) {
        self.minTime = minTime
    }
    
    public func setMaxTime(maxTime: Int) {
        self.maxTime = maxTime
    }
    
    public func getTimeList() -> [String] {
        var timeList: [String] = [String]()
        for time in minTime...maxTime {
            timeList.append(getTimeCharacter(time: time))
        }
        return timeList
    }
    
    public func setDaySymbol(symbols: [String]) {
        var days = [""]
        days.append(contentsOf: symbols)
        daySymbols = days
    }
    
    public func getDaySymbol(index: Int) -> String {
        return daySymbols[index]
    }
    
    public func setPadding(isPadding: Bool) {
        self.isPadding = isPadding
    }
    
    private func getTimeCharacter(time: Int) -> String {
        if isPadding && (time < 10) {
            return "0\(time)"
        } else {
            return "\(time)"
        }
    }
    
    private func getMinHour() -> Int {
        var minTime: Int = 24
        courseList.forEach { item in
            let hour = getHourMinFromTimeString(isHour: true, string: item.startTime)
            if hour < minTime {
                minTime = hour
            }
        }
        return minTime < 9 ? minTime : 9
    }
    
    private func getMaxHour() -> Int {
        var maxTime: Int = 0
        courseList.forEach { item in
            let hour = getHourMinFromTimeString(isHour: true, string: item.endTime)
            if hour > maxTime {
                maxTime = hour
            }
        }
        return maxTime > 20 ? maxTime : 20
    }
    
    private func getHourMinFromTimeString(isHour: Bool, string: String) -> Int {
        let hour = string.split(separator: ":")[0]
        let minute = string.split(separator: ":")[1]
        
        if isHour {
            return Int(hour) ?? 9
        } else {
            return Int(minute) ?? 0
        }
    }
}
