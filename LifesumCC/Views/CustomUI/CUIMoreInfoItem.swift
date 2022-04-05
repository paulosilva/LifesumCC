//
//  CUIMoreInfoItem.swift
//  LifesumCC
//
//  Created by Paulo Silva on 03/04/2022.
//

import SwiftUI

struct CUIMoreInfoItemSettings {
    static let padding = 5.0
}

struct CUIMoreInfoItem: View {
    
    var label: String
    var fontSize: Double
    var fontColor: Color
    var textCase: Text.Case?
    
    var body: some View {
        Text(label)
            .foregroundColor(fontColor)
            .font(.system(size: fontSize, weight: .light))
            .textCase(textCase)
            .padding(CUIMoreInfoItemSettings.padding)
    }
}

struct MoreInfoItem_Previews: PreviewProvider {
    static var previews: some View {
        CUIMoreInfoItem(label: "Carbs", fontSize: 23, fontColor: .gray)
    }
}
