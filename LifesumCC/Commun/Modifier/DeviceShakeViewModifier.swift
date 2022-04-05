//
//  DeviceShakeViewModifier.swift
//  LifesumCC
//
//  Created by Paulo Silva on 02/04/2022.
//

import Foundation
import SwiftUI

/// https://www.hackingwithswift.com/quick-start/swiftui/how-to-detect-shake-gestures
/// A view modifier that detects shaking and calls a function of our choosing.
struct DeviceShakeViewModifier: ViewModifier {
    let action: () -> Void

    func body(content: Content) -> some View {
        content
            .onAppear()
            .onReceive(NotificationCenter.default.publisher(for: UIDevice.deviceDidShakeNotification)) { _ in
                action()
            }
    }
}
