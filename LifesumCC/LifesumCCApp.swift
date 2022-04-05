//
//  LifesumCCApp.swift
//  LifesumCC
//
//  Created by Paulo Silva on 02/04/2022.
//

import SwiftUI

@main
struct LifesumCCApp: App {

    var body: some Scene {
        WindowGroup {
            
            FoodNutritionView()
                .background(.white)
            
            /// .background(.white)
            /// So the app keeps the UI/UX even on the dark mode
            
        }
    }
}
