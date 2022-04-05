//
//  CUIRoundedView.swift
//  LifesumCC
//
//  Created by Paulo Silva on 02/04/2022.
//

import SwiftUI

struct CUIRoundedViewSettings {
    static let backgroundGradientStartColor =  Color(red: 243/255, green: 167/255, blue: 78/255, opacity: 1.0)
    static let backgroundGradientEndColor = Color(red: 237/255, green: 84/255, blue: 96/255, opacity: 1.0)
    static let shadowColor = Color(red: 255/255, green: 102/255, blue: 92/255, opacity: 33/255)
    static let shadowRadious = 6.0
    static let shadowX = 0.0
    static let shadowY = 16.0
    static let textFontSize = 23.0
    static let caloriesFontSize = 65.0
    static let frameWidthCorrection = 60.0
}

struct CUIRoundedView: View {
    var title: String
    var calories: Int
    var perServing: String
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                
                Circle()
                    .fill(
                        LinearGradient(
                            gradient: Gradient(
                                colors: [
                                    CUIRoundedViewSettings.backgroundGradientStartColor,
                                    CUIRoundedViewSettings.backgroundGradientEndColor]
                            ),
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
                    .shadow(
                        color: CUIRoundedViewSettings.shadowColor,
                        radius: CUIRoundedViewSettings.shadowRadious,
                        x: CUIRoundedViewSettings.shadowX,
                        y: CUIRoundedViewSettings.shadowY)

                VStack {

                    CUITitleWithDivider(label: title, color: .roundedViewTextColor)
                        .frame(maxWidth: geometry.size.width - CUIRoundedViewSettings.frameWidthCorrection)
                    
                    if calories == 0 {
                        Text(". .")
                            .foregroundColor(.roundedViewTextColor)
                            .font(.system(size: CUIRoundedViewSettings.textFontSize, weight: .light))
                    }
                    
                    Text("\(calories)")
                        .foregroundColor(.roundedViewTextColor)
                        .font(.system(size: CUIRoundedViewSettings.caloriesFontSize, weight: .light))
                    
                    Text(perServing)
                        .foregroundColor(.roundedViewTextColor)
                        .font(.system(size: CUIRoundedViewSettings.textFontSize, weight: .light))
                }
            }
            .frame(maxWidth: geometry.size.width)
        }
    }
}

struct CUIRoundedView_Previews: PreviewProvider {
    static var previews: some View {
        CUIRoundedView(title: "Cashews", calories: 400, perServing: "Calories per serving")
        
        CUIRoundedView(title: "Cashews Cashews Cashews Cashews", calories: 400, perServing: "Calories per serving")
    }
}
