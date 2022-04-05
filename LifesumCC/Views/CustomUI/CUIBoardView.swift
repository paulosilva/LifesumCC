//
//  CUIBoardView.swift
//  LifesumCC
//
//  Created by Paulo Silva on 02/04/2022.
//

import SwiftUI

struct CUIBoardViewSettings {
    static let decimalPlaces = 0
    static let offsetX = 0.0
    static let offsetY = -50.0
}

struct CUIBoardView: View {
    
    var nutritional: NutritionalResponse?
    
    var body: some View {
        HStack {
            Spacer()
            
            if let carbs = nutritional?.carbs {
                CUIBoardItem(
                    label: AppLocalizableKey.kCarbsLabel.localized,
                    color: .boardViewTextColor,
                    value: carbs.roundTo(decimalPlaces: CUIBoardViewSettings.decimalPlaces))
            }
            
            if let protein = nutritional?.protein {
                CUIBoardItem(
                    label: AppLocalizableKey.kProteinLabel.localized,
                    color: .boardViewTextColor,
                    value: protein.roundTo(decimalPlaces: CUIBoardViewSettings.decimalPlaces))
            }
            
            if let fat = nutritional?.fat {
                CUIBoardItem(
                    label: AppLocalizableKey.kFatLabel.localized,
                    color: .boardViewTextColor,
                    value: fat.roundTo(decimalPlaces: CUIBoardViewSettings.decimalPlaces))
            }
            
            Spacer()
        }
        .padding(.bottom)
        .offset(
            x: CUIBoardViewSettings.offsetX,
            y: CUIBoardViewSettings.offsetY)
    }
}

struct CUIBoardView_Previews: PreviewProvider {
    static var previews: some View {
        CUIBoardView(nutritional: nil)
    }
}
