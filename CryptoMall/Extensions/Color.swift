//
//  Color.swift
//  CryptoMall
//
//  Created by TTGMOTSF on 06/04/2023.
//

import Foundation
import SwiftUI

extension Color {
    
    static let theme = ColorTheme()
    static let launchTheme = LaunchTheme()
}

struct ColorTheme {
    
    let accentColor = Color("AccentColor")
    let background = Color("BackgroundColor")
    let green = Color("GreenColor")
    let red = Color("RedColor")
    let secondaryText = Color("SecondaryTextColor")
    let menuColor = Color("MenuColor")
    let blueColor = Color("Blue")
    let bgColor = Color("bg")
    let topColor = Color("Top")
    let gradientColorRed = Color("GradientColorRed")
}

struct LaunchTheme{
    let launchAccent = Color("LaunchAccentColor")
    let launchBackground = Color("LaunchBackgroundColor")
}
