//
//  CustomCorners.swift
//  CryptoMall
//
//  Created by TTGMOTSF on 17/04/2023.
//

import SwiftUI

struct CustomCorners: Shape {
    
    var corners: UIRectCorner
    var radious: CGFloat
    
    func path(in rect: CGRect) -> Path{
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radious, height: radious))
        return Path(path.cgPath)
    }
}
