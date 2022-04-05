//
//  ContentView.swift
//  LifesumCC
//
//  Created by Paulo Silva on 02/04/2022.
//

import SwiftUI

struct FoodNutritionViewSettings {
    static let defaultCaloriesValue = 0
    static let boardViewFrameHeight = 200.0
    static let roundedButtonFrameWidth = 200.0
}

struct FoodNutritionView: View {
    
    @StateObject private var foodViewModel = FoodNutritionViewModel()
    
    @State private var showMoreInfoView: Bool = false

    var body: some View {
        VStack {
            
            CUIRoundedView(
                title: foodViewModel.nutritionalViewModel.title ?? AppLocalizableKey.kSomethingWentWrongTitel.localized,
                calories: foodViewModel.nutritionalViewModel.calories ?? FoodNutritionViewSettings.defaultCaloriesValue,
                perServing: foodViewModel.nutritionalViewModel.pcsText ?? AppLocalizableKey.kSomethingWentWrongMessage.localized)
            
            CUIBoardView(
                nutritional: foodViewModel.nutritionalViewModel.nutritionInformation?.response)
            .frame(height: FoodNutritionViewSettings.boardViewFrameHeight)
            
            CUIRoundedButton(
                label: AppLocalizableKey.kMoreInfoLabel.localized) {
                    
                    /// Ddsplay more information about the selected food
                    showMoreInfoView = true
                }
                .frame(width: FoodNutritionViewSettings.roundedButtonFrameWidth)
 
            Divider()
            
            Text(AppLocalizableKey.kShakeDeviceMessage.localized)
                .padding(.bottom)
            
        }
        .padding(30)
        .onAppear() {
            foodViewModel.fetchData()
        }
        .onShake {
            foodViewModel.fetchData()
        }
        .sheet(isPresented: $showMoreInfoView) {
            let viewModel = MoreInfoViewModel(
                nutritional: foodViewModel.nutritionalViewModel)
            
            MoreInfoView(viewModel: viewModel,
                         isPresented: $showMoreInfoView)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        FoodNutritionView()
    }
}
