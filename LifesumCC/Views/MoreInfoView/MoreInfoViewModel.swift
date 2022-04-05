//
//  MoreInfoViewModel.swift
//  LifesumCC
//
//  Created by Paulo Silva on 03/04/2022.
//

import Foundation

class MoreInfoViewModel: ObservableObject {
    @Published var nutritionalViewModel: NutritionalViewModel?
    
    init(nutritional: NutritionalViewModel?) {
        self.nutritionalViewModel = nutritional
    }
    
}
