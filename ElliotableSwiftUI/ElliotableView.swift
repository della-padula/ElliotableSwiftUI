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
            LazyVGrid(columns: getColumnGrid(dayCount: ElliotableConstant.shared.getDayCount()), spacing: 0) {
                let columnCount = ElliotableConstant.shared.getDayCount() + 1
                let totalCellCount = (ElliotableConstant.shared.getTimeList().count + 1) * (ElliotableConstant.shared.getDayCount() + 1)
                ForEach((0..<totalCellCount), id: \.self) { index in
                    if index < columnCount {
                        TimetableHeaderView(index: index)
                    } else {
                        if (index % columnCount) == 0 {
                            if index / columnCount == totalCellCount / columnCount {
                                TimetableFirstColumnView(index: index / columnCount, isLastRow: true)
                            } else {
                                TimetableFirstColumnView(index: index / columnCount)
                            }
                        } else {
                            if index / columnCount == totalCellCount / columnCount {
                                TimetableItemView(index: index, title: "TLE\(index)", subTitle: "SUB\(index)", isLastRow: true)
                            } else {
                                TimetableItemView(index: index, title: "TLE\(index)", subTitle: "SUB\(index)")
                            }
                        }
                    }
                }
            }.lineSpacing(0).border(ElliotableConstant.shared.getBorderColor(), width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
        }
    }
    
    public func borderColor(color: Color) {
        ElliotableConstant.shared.setBorderColor(color: color)
    }
    
    public func symbolBackgroundColor(color: Color) {
        ElliotableConstant.shared.setSymbolBackgroundColor(color: color)
    }
    
    public func itemBackgroundColor(color: Color) {
        ElliotableConstant.shared.setItemBackgroundColor(color: color)
    }
    
    public func symbolHeaderTextColor(color: Color) {
        ElliotableConstant.shared.setSymbolHeaderTextColor(color: color)
    }
    
    public func timeHeaderTextColor(color: Color) {
        ElliotableConstant.shared.setTimeHeaderTextColor(color: color)
    }
    
    public func headerFont(font: Font) {
        
    }
    
    public func timeFont(font: Font) {
        
    }
    
    public func daySymbols(symbols: [String]) {
        ElliotableConstant.shared.setDaySymbol(symbols: symbols)
    }
    
    public func courseList(list: [ElliottEvent]) {
        ElliotableConstant.shared.setCourseList(list: list)
    }
    
    public func dayCount(count: Int) {
        ElliotableConstant.shared.setDayCount(count: count)
    }
    
    public func height(header: CGFloat, item: CGFloat) {
        ElliotableConstant.shared.setHeaderHeight(height: header)
        ElliotableConstant.shared.setItemHeight(height: item)
    }
}

public struct TimetableItemView: View {
    private var title: String?
    private var subTitle: String?
    private var index: Int = -1
    private var isLastRow: Bool = false
    
    public init(index: Int, title: String, subTitle: String?, isLastRow: Bool = false) {
        self.index = index
        self.title = title
        self.subTitle = subTitle
        self.isLastRow = isLastRow
    }
    
    public var body: some View {
        if isLastRow {
            VStack(alignment: .leading) { }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: ElliotableConstant.shared.getHeight(isHeader: false))
                .border(width: 1, edge: .trailing, color: ElliotableConstant.shared.getBorderColor())
                .background(ElliotableConstant.shared.getItemBackgroundColor())
        } else {
            VStack(alignment: .leading) { }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: ElliotableConstant.shared.getHeight(isHeader: false))
                .border(width: 1, edge: .trailing, color: ElliotableConstant.shared.getBorderColor())
                .border(width: 1, edge: .bottom, color: ElliotableConstant.shared.getBorderColor())
                .background(ElliotableConstant.shared.getItemBackgroundColor())
        }
    }
}

public struct TimetableHeaderView: View {
    private var index: Int = 0
    
    public init(index: Int) {
        self.index = index
    }
    
    public var body: some View {
        Text(index < 1 ? "" : ElliotableConstant.shared.getDaySymbol(index: index))
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: ElliotableConstant.shared.getHeight(isHeader: true))
            .border(width: 1, edge: .trailing, color: ElliotableConstant.shared.getBorderColor())
            .border(width: 1, edge: .bottom, color: ElliotableConstant.shared.getBorderColor())
            .background(ElliotableConstant.shared.getSymbolBackgroundColor())
            .foregroundColor(ElliotableConstant.shared.getSymbolHeaderTextColor())
            .font(.system(size: 14, weight: .bold))
    }
}

public struct TimetableFirstColumnView: View {
    private var index: Int = 0
    private var isLastRow: Bool = false
    
    public init(index: Int, isLastRow: Bool = false) {
        self.index = index
        self.isLastRow = isLastRow
    }
    
    public var body: some View {
        if isLastRow {
            VStack(alignment: .leading) {
                HStack {
                    Spacer()
                    Text(ElliotableConstant.shared.getTimeList()[self.index - 1])
                        .font(.system(size: 10))
                        .padding([.top, .trailing],4)
                }
                Spacer()
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: ElliotableConstant.shared.getHeight(isHeader: false))
            .border(width: 1, edge: .trailing, color: ElliotableConstant.shared.getBorderColor())
            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/, 0)
            .foregroundColor(ElliotableConstant.shared.getTimeHeaderTextColor())
            .background(ElliotableConstant.shared.getSymbolBackgroundColor())
        } else {
            VStack(alignment: .leading) {
                HStack {
                    Spacer()
                    Text(ElliotableConstant.shared.getTimeList()[self.index - 1])
                        .font(.system(size: 10))
                        .padding([.top, .trailing],4)
                }
                Spacer()
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: ElliotableConstant.shared.getHeight(isHeader: false))
            .border(width: 1, edge: .trailing, color: ElliotableConstant.shared.getBorderColor())
            .border(width: 1, edge: .bottom, color: ElliotableConstant.shared.getBorderColor())
            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/, 0)
            .foregroundColor(ElliotableConstant.shared.getTimeHeaderTextColor())
            .background(ElliotableConstant.shared.getSymbolBackgroundColor())
        }
    }
}
