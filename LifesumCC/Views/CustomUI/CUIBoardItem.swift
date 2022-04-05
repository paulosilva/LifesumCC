//
//  CUIBoardItem.swift
//  LifesumCC
//
//  Created by Paulo Silva on 02/04/2022.
//

import SwiftUI

struct CUIBoardItemSettings {
    static let textFontSize = 16.0
    static let dividerFrameHeight = 0.5
    static let dividerOffsetX = 0.0
    static let dividerOffsetY = -10.0
    static let padding = 10.0
}

struct CUIBoardItem: View {
    var label: String
    var color: Color
    var value: String
    
    var body: some View {
        VStack {
            Text(label)
                .foregroundColor(color)
                .font(.system(size: CUIBoardItemSettings.textFontSize, weight: .light))
                .textCase(.uppercase)
            
            Rectangle()
                .fill(color)
                .frame(height: CUIBoardItemSettings.dividerFrameHeight)
                .offset(
                    x: CUIBoardItemSettings.dividerOffsetX,
                    y: CUIBoardItemSettings.dividerOffsetY)
            
            Text("\(value)%")
                .foregroundColor(color)
                .font(.system(size: CUIBoardItemSettings.textFontSize, weight: .light))
                .textCase(.uppercase)
        }
        .fixedSize()
        .padding([.leading, .bottom, .trailing], CUIBoardItemSettings.padding)
    }
}

struct CUIBoardItem_Previews: PreviewProvider {
    static var previews: some View {
        CUIBoardItem(label: "CARBS", color: .gray, value: "3.04")
    }
}
