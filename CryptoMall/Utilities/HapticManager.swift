//
//  HapticManager.swift
//  CryptoMall
//
//  Created by TTGMOTSF on 11/04/2023.
//

import Foundation
import SwiftUI

class HapticManager {
    
    static let hapticGenerator = UINotificationFeedbackGenerator()
    static func notification (type: UINotificationFeedbackGenerator.FeedbackType ) {
        hapticGenerator.notificationOccurred(type)
    }
}
