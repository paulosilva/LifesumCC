//
//  UIDevice+Extension.swift
//  LifesumCC
//
//  Created by Paulo Silva on 02/04/2022.
//

import Foundation
import UIKit

/// https://www.hackingwithswift.com/quick-start/swiftui/how-to-detect-shake-gestures
/// The notification we'll send when a shake gesture happens.
extension UIDevice {
    static let deviceDidShakeNotification = Notification.Name(rawValue: "deviceDidShakeNotification")
}
