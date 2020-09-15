//
//  ElliotableView.swift
//  ElliotableSwiftUI
//
//  Created by Denny on 2020/09/15.
//

import Foundation
import SwiftUI

public struct ElliotableView: View {
    public func getColumnGrid(dayCount: Int) -> [GridItem] {
        var gridLayout: [GridItem] = [GridItem(.fixed(25), spacing: 0)]
        for _ in 0..<dayCount {
            gridLayout.append(GridItem(.flexible(), spacing: 0))
        }
        return gridLayout
    }
    
    public init() { }
    
    public var body: some View {
        ScrollView {
            LazyVGrid(columns: getColumnGrid(dayCount: 5), spacing: 0) {
                ForEach((0..<60), id: \.self) { index in
                    if index < 6 {
                        TimetableHeaderView(index: index)
                    } else {
                        if (index % 6) == 0 {
                            TimetableFirstColumnView(index: index / 6)
                        } else {
                            TimetableItemView(index: index, title: "TLE\(index)", subTitle: "SUB\(index)")
                        }
                    }
                }
            }.lineSpacing(0).border(Color.black, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
        }
    }
    
    public func daySymbols(symbols: [String]) -> some View {
        ElliotableConstant.shared.setDaySymbol(symbols: symbols)
        return self
    }
    
    public func courseList(list: [ElliottEvent]) -> some View {
        ElliotableConstant.shared.setCourseList(list: list)
        return self
    }
    
    public func dayCount(count: Int) -> some View {
        ElliotableConstant.shared.setDayCount(count: count)
        return self
    }
}

public struct TimetableItemView: View {
    private var title: String?
    private var subTitle: String?
    private var index: Int = -1
    
    public init(index: Int, title: String, subTitle: String?) {
        self.index = index
        self.title = title
        self.subTitle = subTitle
    }
    
    public var body: some View {
        VStack(alignment: .leading) {
            Text(title ?? "").font(.system(size: 16))
            Text(subTitle ?? "").font(.system(size: 12))
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 50)
        .border(width: 1, edge: .trailing, color: Color.black)
        .border(width: 1, edge: .bottom, color: Color.black)
    }
}

public struct TimetableHeaderView: View {
    private var index: Int = 0
    
    public init(index: Int) {
        self.index = index
    }
    
    public var body: some View {
        Text(index < 1 ? "" : ElliotableConstant.shared.getDaySymbol(index: index))
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 25)
            .border(width: 1, edge: .trailing, color: Color.black)
            .border(width: 1, edge: .bottom, color: Color.black)
    }
}

public struct TimetableFirstColumnView: View {
    private var index: Int = 0
    
    public init(index: Int) {
        self.index = index
    }
    
    public var body: some View {
        Text(ElliotableConstant.shared.getTimeList()[self.index])
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 50)
            .border(width: 1, edge: .trailing, color: Color.black)
            .border(width: 1, edge: .bottom, color: Color.black)
    }
}
