//
//  BlobShapeTop.swift
//  Onboarding 1
//
//  Created by Sourany on 2021-04-01.
//

import SwiftUI

struct BlobShapeTop: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.66498*width, y: 0.70619*height))
        path.addCurve(to: CGPoint(x: 0.38191*width, y: 0.89473*height), control1: CGPoint(x: 0.48737*width, y: 0.70619*height), control2: CGPoint(x: 0.46229*width, y: 0.78158*height))
        path.addCurve(to: CGPoint(x: 0.03778*width, y: 0.35427*height), control1: CGPoint(x: 0.17654*width, y: 1.18381*height), control2: CGPoint(x: -0.06879*width, y: 0.78664*height))
        path.addCurve(to: CGPoint(x: 0.89255*width, y: 0.27257*height), control1: CGPoint(x: 0.17099*width, y: -0.18619*height), control2: CGPoint(x: 0.63723*width, y: 0.01491*height))
        path.addCurve(to: CGPoint(x: 0.66498*width, y: 0.70619*height), control1: CGPoint(x: 1.14787*width, y: 0.53023*height), control2: CGPoint(x: 0.887*width, y: 0.70619*height))
        path.closeSubpath()
        return path
    }
}

struct BlobShapeTop_Previews: PreviewProvider {
    static var previews: some View {
        BlobShapeTop()
    }
}
