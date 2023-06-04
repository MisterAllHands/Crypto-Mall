//
//  BoomerangBG.swift
//  Onboarding 1
//
//  Created by Sourany on 2021-04-01.
//

import SwiftUI

struct BoomerangBG: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.32433*width, y: 0.77459*height))
        path.addCurve(to: CGPoint(x: 0.06085*width, y: 0.98158*height), control1: CGPoint(x: 0.26949*width, y: 1.02571*height), control2: CGPoint(x: 0.11381*width, y: 1.01706*height))
        path.addCurve(to: CGPoint(x: 0.08797*width, y: 0.5321*height), control1: CGPoint(x: -0.08639*width, y: 0.83372*height), control2: CGPoint(x: 0.07867*width, y: 0.64565*height))
        path.addCurve(to: CGPoint(x: 0.12672*width, y: 0.05304*height), control1: CGPoint(x: 0.09959*width, y: 0.39016*height), control2: CGPoint(x: 0.03373*width, y: 0.16541*height))
        path.addCurve(to: CGPoint(x: 0.45995*width, y: 0.18316*height), control1: CGPoint(x: 0.21971*width, y: -0.05933*height), control2: CGPoint(x: 0.35145*width, y: 0.01756*height))
        path.addCurve(to: CGPoint(x: 0.81642*width, y: 0.26004*height), control1: CGPoint(x: 0.56844*width, y: 0.34875*height), control2: CGPoint(x: 0.56844*width, y: 0.26595*height))
        path.addCurve(to: CGPoint(x: 0.96753*width, y: 0.60899*height), control1: CGPoint(x: 1.01481*width, y: 0.25531*height), control2: CGPoint(x: 1.02953*width, y: 0.49408*height))
        path.addCurve(to: CGPoint(x: 0.66531*width, y: 0.66812*height), control1: CGPoint(x: 0.91328*width, y: 0.70953*height), control2: CGPoint(x: 0.8048*width, y: 0.80533*height))
        path.addCurve(to: CGPoint(x: 0.32433*width, y: 0.77459*height), control1: CGPoint(x: 0.49094*width, y: 0.49661*height), control2: CGPoint(x: 0.39019*width, y: 0.47296*height))
        path.closeSubpath()
        return path
    }
}

struct BoomerangBG_Previews: PreviewProvider {
    static var previews: some View {
        BoomerangBG()
    }
}
