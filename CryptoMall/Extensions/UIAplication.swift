//
//  UIAplication.swift
//  CryptoMall
//
//  Created by TTGMOTSF on 09/04/2023.
//

import Foundation
import SwiftUI


extension UIApplication {
    
    func endEditing () {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
}
