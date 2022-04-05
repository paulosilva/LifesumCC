//
//  AppSettings.swift
//  LifesumCC
//
//  Created by Paulo Silva on 02/04/2022.
//

import Foundation

struct AppSettings {
    private static var randomIdsRange = 1...200
    private static var alreadyDisplayedIds: [Int] = [Int]()
    
    static var foodId: Int {
        let newId = Int.random(in: randomIdsRange)
        
        if alreadyDisplayedIds.count == randomIdsRange.upperBound {
            reset()
        } else if alreadyDisplayedIds.contains(newId) {
            return self.foodId
        }
        
        alreadyDisplayedIds.append(newId)
        
        return newId
    }
    
    static func reset() {
        alreadyDisplayedIds = [Int]()
    }
}
