//
//  UIWindow+Extension.swift
//  LifesumCC
//
//  Created by Paulo Silva on 02/04/2022.
//

import Foundation
import UIKit

/// https://www.hackingwithswift.com/quick-start/swiftui/how-to-detect-shake-gestures
/// Override the default behavior of shake gestures to send our notification instead.
extension UIWindow {
     open override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            NotificationCenter.default.post(name: UIDevice.deviceDidShakeNotification, object: nil)
        }
     }
}
