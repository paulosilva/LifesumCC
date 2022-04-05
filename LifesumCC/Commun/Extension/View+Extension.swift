//
//  View+Extension.swift
//  LifesumCC
//
//  Created by Paulo Silva on 02/04/2022.
//

import Foundation
import SwiftUI

/// https://www.hackingwithswift.com/quick-start/swiftui/how-to-detect-shake-gestures
/// A View extension to make the modifier easier to use.
extension View {
    func onShake(perform action: @escaping () -> Void) -> some View {
        self.modifier(DeviceShakeViewModifier(action: action))
    }
}
