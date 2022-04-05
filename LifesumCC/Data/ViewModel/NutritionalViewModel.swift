//
//  NutritionalViewModel.swift
//  LifesumCC
//
//  Created by Paulo Silva on 02/04/2022.
//

import Foundation

struct NutritionalViewModel {
    private let ignoreKeys = ["title","pcsText","calories"]
    
    var nutritionInformation: NutritionalInformation?
    
    init (_ nutritionInformation: NutritionalInformation? = nil) {
        self.nutritionInformation = nutritionInformation
    }
    
    var title: String? {
        return nutritionalResponse?.title
    }
    
    var pcsText: String? {
        return nutritionalResponse?.pcsText
    }
    
    var calories: Int? {
        return nutritionalResponse?.calories
    }
    
    var carbs: Double? {
        return nutritionalResponse?.carbs
    }
    
    var fiber: Double? {
        return nutritionalResponse?.fiber
    }
    
    var potassium: Double? {
        return nutritionalResponse?.potassium
    }
    
    var sodium: Double? {
        return nutritionalResponse?.sodium
    }
    
    var fat: Double? {
        return nutritionalResponse?.fat
    }
    
    var sugar: Double? {
        return nutritionalResponse?.sugar
    }
    
    var gramsPerServing: Double? {
        return nutritionalResponse?.gramsPerServing
    }
    
    var cholesterol: Double? {
        return nutritionalResponse?.cholesterol
    }
    
    var protein: Double? {
        return nutritionalResponse?.protein
    }
    
    var unsaturatedFat: Double? {
        return nutritionalResponse?.unsaturatedFat
    }
    
    var saturatedFat: Double? {
        return nutritionalResponse?.saturatedFat
    }
    
    var plainDataSource: [String : Any] {
        var outputData: [String : Any] = [:]
    
        guard let inputData = nutritionInformation?.response else {
            return outputData
        }
        
        let mirror = Mirror(reflecting: inputData)
        
        for child in mirror.children  {
            if let label = child.label,
                !ignoreKeys.contains(label) {
                outputData[label] = child.value
            }
        }
        
        return outputData
    }
    
    // MARK: - Private methods
    
    private var nutritionalResponse: NutritionalResponse? {
        guard let nutrition = nutritionInformation else {
            return nil
        }
        
        guard let data = nutrition.response else {
            return nil
        }
        
        return data
    }
}
