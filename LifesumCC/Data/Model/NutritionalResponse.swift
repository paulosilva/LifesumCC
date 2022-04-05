//
//  NutritionalResponse.swift
//  LifesumCC
//
//  Created by Paulo Silva on 02/04/2022.
//

import Foundation

struct NutritionalResponse: Decodable {
    let carbs: Double?
    let fiber: Double?
    let title: String?
    let pcsText: String?
    let potassium: Double?
    let sodium: Double?
    let calories: Int?
    let fat: Double?
    let sugar: Double?
    let gramsPerServing: Double?
    let cholesterol: Double?
    let protein: Double?
    let unsaturatedFat: Double?
    let saturatedFat: Double?

    enum CodingKeys: String, CodingKey {
        case carbs = "carbs"
        case fiber = "fiber"
        case title = "title"
        case pcsText = "pcstext"
        case potassium = "potassium"
        case sodium = "sodium"
        case calories = "calories"
        case fat = "fat"
        case sugar = "sugar"
        case gramsPerServing = "gramsperserving"
        case cholesterol = "cholesterol"
        case protein = "protein"
        case unsaturatedFat = "unsaturatedfat"
        case saturatedFat = "saturatedfat"
    }
}
