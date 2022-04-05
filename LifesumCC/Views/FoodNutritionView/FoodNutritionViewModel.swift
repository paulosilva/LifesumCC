//
//  FoodNutritionViewModel.swift
//  LifesumCC
//
//  Created by Paulo Silva on 02/04/2022.
//

import Foundation

class FoodNutritionViewModel: ObservableObject {
    @Published var nutritionalViewModel: NutritionalViewModel = NutritionalViewModel()
    
    func fetchData() {
        
        /// Random food id but don't repeat until loops for all foods
        let foodId = AppSettings.foodId
        
        /// Get data for the food id
        NutritionalAPIClient().fetchDataFor(foodId: foodId){ (result) in
            switch result {
                case .success(let data):
                    DispatchQueue.main.async {
                        self.nutritionalViewModel = NutritionalViewModel(data)
                    }
                case .failure(let error):
                    /// Okay let's request it again.
                    /// On Prod we need to register the error, for deeper investigation.
                    self.fetchData()
                    print(error)
            }
        }
    }
}
