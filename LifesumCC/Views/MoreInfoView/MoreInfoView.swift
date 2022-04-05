//
//  MoreInfoView.swift
//  LifesumCC
//
//  Created by Paulo Silva on 03/04/2022.
//

import SwiftUI

struct MoreInfoViewSettings {
    static let defaultTextValue = ""
    static let spaceFrameHeight = 20.0
    static let roundedButtonFrameWidth = 200.0
    static let textFontSize = 23.0
    static let listFontSize = 18.0
    static let caloriesFontSize = 30.0
    static let caloriesDefaultValue = 0
}

struct MoreInfoView: View {
    var viewModel: MoreInfoViewModel?
    var dataSource: [String : Any] = [:]
    
    @Binding var isPresented: Bool
    
    init(viewModel: MoreInfoViewModel?, isPresented:  Binding<Bool>) {
        self.viewModel = viewModel
        self._isPresented = isPresented
        
        if let plainData = viewModel?.nutritionalViewModel?.plainDataSource {
            dataSource = plainData
        }
    }
    
    var body: some View {
        
        ZStack {
            
            /// So the app keeps the UI/UX even on the dark mod
            Color.white.ignoresSafeArea()
         
            VStack {
                Spacer()
                    .frame(height: MoreInfoViewSettings.spaceFrameHeight)
                
                /// Header
                Group {
                    /// Title
                    CUIMoreInfoItem(
                        label: "\(nutritional?.title ?? MoreInfoViewSettings.defaultTextValue)",
                        fontSize: MoreInfoViewSettings.textFontSize,
                        fontColor: .moreInfoItemTextColor,
                        textCase: .uppercase)
                    
                    /// Calories
                    CUIMoreInfoItem(
                        label: "\(nutritional?.calories ?? MoreInfoViewSettings.caloriesDefaultValue)",
                        fontSize: MoreInfoViewSettings.caloriesFontSize,
                        fontColor: .moreInfoItemTextColor)
                    
                    /// PCS Text
                    CUIMoreInfoItem(
                        label: "\(nutritional?.pcsText ?? MoreInfoViewSettings.defaultTextValue)",
                        fontSize: MoreInfoViewSettings.textFontSize,
                        fontColor: .moreInfoItemTextColor)
                }
               
                List {
                    ForEach(dataSource.keys.sorted(),  id:\.self) { key in
                        let viewModel = MoreInfoRowViewModel(attributeName: key, value: dataSource[key])
                        
                        /// Create a custom row view for better data display
                        Text("\(viewModel.description)")
                            .foregroundColor(.moreInfoItemTextColor)
                            .font(.system(size:  MoreInfoViewSettings.listFontSize,
                                          weight: .light))
                    }
                }
                .listStyle(PlainListStyle())
                
                Spacer()
                
                CUIRoundedButton(
                    label: AppLocalizableKey.kCloseLabel.localized) {

                        /// dismiss the view
                        isPresented = false
                    }
                    .frame(width: MoreInfoViewSettings.roundedButtonFrameWidth)
                
                Spacer()
                    .frame(height: MoreInfoViewSettings.spaceFrameHeight)
            }
        }
    }
    
    private var nutritional: NutritionalViewModel? {
        guard let nutritionalModel = viewModel?.nutritionalViewModel else {
            return nil
        }
        
        return nutritionalModel
    }
}

struct MoreInfoView_Previews: PreviewProvider {
    static var previews: some View {
        MoreInfoView(
            viewModel: MoreInfoViewModel(nutritional: nil),
            isPresented: .constant(true))
    }
}
