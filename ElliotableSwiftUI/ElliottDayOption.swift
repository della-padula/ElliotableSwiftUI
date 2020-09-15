//
//  ElliottDayOption.swift
//  ElliotableSwiftUI
//
//  Created by Denny on 2020/09/15.
//

import Foundation

public enum ElliotDay: Int {
    case monday    = 1
    case tuesday   = 2
    case wednesday = 3
    case thursday  = 4
    case friday    = 5
    case saturday  = 6
    case sunday    = 7
    
    func getDaySymbol() -> String {
        return ElliotableConstant.shared.getDaySymbol(index: self.rawValue)
    }
}

public enum ElliotDayType: Int {
    case normalType
    case shortType
    case shortestType
}
