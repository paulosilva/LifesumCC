//
//  CUIRoundedButton.swift
//  LifesumCC
//
//  Created by Paulo Silva on 02/04/2022.
//

import SwiftUI

struct CUIRoundedButtonSettings {
    static let backgroundGradientStartColor =  Color(red: 1/255, green: 5/255, blue: 33/255, opacity: 1.0)
    static let backgroundGradientEndColor = Color(red: 2/255, green: 6/255, blue: 39/255, opacity: 1.0)
    static let shadowColor = Color(red: 0/255, green: 0/255, blue: 0/255, opacity: 33/255)
    static let textFontSize = 23.0
    static let textVerticalPadding = 20.0
    static let textHorizontalPadding = 50.0
    static let textFrameWidth = 300.0
    static let textCornerRadius = 100.0
    static let textShadowRadius = 6.0
    static let textShadowX = 0.0
    static let textShadowY = 16.0
}

struct CUIRoundedButton: View {
    var label: String
    var action: () -> Void
    
    var body: some View {
        Button(action: { action() }, label: {
            Text(label)
                .foregroundColor(.moreInfoButtonTextColor)
                .font(.system(size: CUIRoundedButtonSettings.textFontSize, weight: .light))
                .textCase(.uppercase)
                .padding(.vertical, CUIRoundedButtonSettings.textVerticalPadding)
                .padding(.horizontal, CUIRoundedButtonSettings.textHorizontalPadding)
                .frame(width: CUIRoundedButtonSettings.textFrameWidth)
                .background(
                    LinearGradient(
                        gradient: Gradient(
                            colors: [
                                CUIRoundedButtonSettings.backgroundGradientStartColor,
                                CUIRoundedButtonSettings.backgroundGradientEndColor]
                        ),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .cornerRadius(CUIRoundedButtonSettings.textCornerRadius)
                .shadow(
                    color: CUIRoundedButtonSettings.shadowColor,
                    radius: CUIRoundedButtonSettings.textCornerRadius,
                    x: CUIRoundedButtonSettings.textShadowX,
                    y: CUIRoundedButtonSettings.textShadowY)
                
        })
    }
}

struct CUIRoundedButton_Previews: PreviewProvider {
    static var previews: some View {
        CUIRoundedButton(label: "MORE INFO"){
            print("Some action done ... ")
        }
    }
}
