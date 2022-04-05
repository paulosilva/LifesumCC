//
//  MoreInfoRowViewModel.swift
//  LifesumCC
//
//  Created by Paulo Silva on 03/04/2022.
//

import Foundation

struct MoreInfoRowViewModel {
    private let absValues = ["Gramsperserving"]
    private let defaultAttributeValue: Double = 0.0
    
    let attributeName: String
    let value: Any?
    
    init(attributeName: String, value: Any?) {
        self.attributeName = attributeName
        self.value = value
    }
    
    var description: String {
        let localeKey = "kRow\(self.attributeName.capitalized)Label"
        
        let computedValue = self.value as? Double ?? defaultAttributeValue
        let value = computedValue.removeZerosFromEnd()
        
        var rowValue = "\(value)% \(localeKey.localized)"
        if absValues.contains(self.attributeName.capitalized) {
            rowValue = "\(value) \(localeKey.localized)"
        }
        
        return rowValue
    }
}
