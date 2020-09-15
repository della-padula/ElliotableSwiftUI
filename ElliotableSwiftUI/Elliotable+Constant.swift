//
//  Elliotable+Constant.swift
//  ElliotableSwiftUI
//
//  Created by Denny on 2020/09/15.
//

import Foundation

public class ElliotableConstant {
    public static let shared: ElliotableConstant = ElliotableConstant()
    private var daySymbols: [String] = ["월", "화", "수", "목", "금", "토", "일"]
    
    private init() { }
    
    public func setDaySymbol(symbols: [String]) {
        daySymbols = symbols
    }
    
    public func getDaySymbol(index: Int) -> String? {
        return daySymbols[index]
    }
    
    public func getTimeCharacter(isPadding: Bool, time: Int) -> String {
        if isPadding && (time < 10) {
            return "0\(time)"
        } else {
            return "\(time)"
        }
    }
}
