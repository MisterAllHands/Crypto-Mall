//
//  BoomerangLeft.swift
//  Onboarding 1
//
//  Created by Sourany on 2021-04-01.
//

import SwiftUI

struct BoomerangLeft: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.67425*width, y: 0.22407*height))
        path.addCurve(to: CGPoint(x: 0.93717*width, y: 0.01831*height), control1: CGPoint(x: 0.72897*width, y: -0.02556*height), control2: CGPoint(x: 0.88433*width, y: -0.01696*height))
        path.addCurve(to: CGPoint(x: 0.91011*width, y: 0.46511*height), control1: CGPoint(x: 1.0841*width, y: 0.16529*height), control2: CGPoint(x: 0.91939*width, y: 0.35224*height))
        path.addCurve(to: CGPoint(x: 0.87144*width, y: 0.94131*height), control1: CGPoint(x: 0.89851*width, y: 0.60621*height), control2: CGPoint(x: 0.96423*width, y: 0.82961*height))
        path.addCurve(to: CGPoint(x: 0.53891*width, y: 0.81198*height), control1: CGPoint(x: 0.77864*width, y: 1.05301*height), control2: CGPoint(x: 0.64718*width, y: 0.97659*height))
        path.addCurve(to: CGPoint(x: 0.18319*width, y: 0.73555*height), control1: CGPoint(x: 0.43065*width, y: 0.64736*height), control2: CGPoint(x: 0.43065*width, y: 0.72967*height))
        path.addCurve(to: CGPoint(x: 0.0324*width, y: 0.38868*height), control1: CGPoint(x: -0.01477*width, y: 0.74025*height), control2: CGPoint(x: -0.02946*width, y: 0.5029*height))
        path.addCurve(to: CGPoint(x: 0.33399*width, y: 0.3299*height), control1: CGPoint(x: 0.08653*width, y: 0.28874*height), control2: CGPoint(x: 0.19479*width, y: 0.1935*height))
        path.addCurve(to: CGPoint(x: 0.67425*width, y: 0.22407*height), control1: CGPoint(x: 0.50798*width, y: 0.50039*height), control2: CGPoint(x: 0.60852*width, y: 0.52389*height))
        path.closeSubpath()
        return path
    }
}

struct BoomerangLeft_Previews: PreviewProvider {
    static var previews: some View {
        BoomerangLeft()
    }
}
