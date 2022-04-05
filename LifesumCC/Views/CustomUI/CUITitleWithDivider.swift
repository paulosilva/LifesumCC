//
//  CUITitleWithDivider.swift
//  LifesumCC
//
//  Created by Paulo Silva on 02/04/2022.
//

import SwiftUI

struct CUITitleWithDividerSettings {
    static let textFontSize = 23.0
    static let frameWidthCorrection = 60.0
    static let dividerHeight = 0.5
    static let dividerOffsetX = 0.0
    static let dividerOffsetY = -10.0
    static let frameHeight = 40.0
}

struct CUITitleWithDivider: View {
    var label: String
    var color: Color
    
    var body: some View {
        GeometryReader { geometry in
            HStack {
                Spacer()
                
                VStack {
                    
                    Text(label)
                        .lineLimit(1)
                        .minimumScaleFactor(1)
                        .foregroundColor(color)
                        .font(.system(size: CUITitleWithDividerSettings.textFontSize, weight: .light))
                        .textCase(.uppercase)
                        .frame(maxWidth: geometry.size.width - CUITitleWithDividerSettings.frameWidthCorrection)

                    // Divider().foregroundColor(color)
                    Rectangle()
                        .fill(color)
                        .frame(height: CUITitleWithDividerSettings.dividerHeight)
                        .offset(
                            x: CUITitleWithDividerSettings.dividerOffsetX,
                            y: CUITitleWithDividerSettings.dividerOffsetY
                        )
                
                }.fixedSize()
                
                Spacer()
            }
        }
        .frame(height: CUITitleWithDividerSettings.frameHeight)
    }
}

struct CUIRoundedViewTitle_Previews: PreviewProvider {
    static var previews: some View {
        CUITitleWithDivider(label: "Cashews", color: .gray)
    }
}
