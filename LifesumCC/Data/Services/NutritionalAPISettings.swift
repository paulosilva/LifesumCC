//
//  NutritionalAPISettings.swift
//  LifesumCC
//
//  Created by Paulo Silva on 02/04/2022.
//

import Foundation

struct NutritionalAPISettings {
    
    static let version = "v2"
    static let baseUrl = "https://api.lifesum.com/\(version)/foodipedia/codetest"
    static let query = "foodid"
    static let headers = [
        "Authorization": "23863708:465c0554fd00da006338c72e282e939fe6576a25fd00c776c0fbe898c47c9876"
    ]
    
    static func urlStringWithId(_ foodId: Int) -> String {
        return "\(baseUrl)?\(query)=\(foodId)"
    }
}
