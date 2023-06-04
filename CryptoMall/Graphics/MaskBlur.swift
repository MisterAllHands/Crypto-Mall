//
//  MaskBlur.swift
//  Onboarding 1
//
//  Created by Sourany on 2021-04-01.
//

import SwiftUI

struct MaskBlur: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.37474*width, y: 0.30357*height))
        path.addCurve(to: CGPoint(x: 0.93931*width, y: 0.18736*height), control1: CGPoint(x: 0.45153*width, y: -0.03781*height), control2: CGPoint(x: 0.85652*width, y: 0.00515*height))
        path.addCurve(to: CGPoint(x: 0.87474*width, y: 0.47577*height), control1: CGPoint(x: 0.99461*width, y: 0.30904*height), control2: CGPoint(x: 0.98059*width, y: 0.49216*height))
        path.addCurve(to: CGPoint(x: 0.67458*width, y: 0.84541*height), control1: CGPoint(x: 0.65392*width, y: 0.44158*height), control2: CGPoint(x: 0.71701*width, y: 0.67326*height))
        path.addCurve(to: CGPoint(x: 0.16738*width, y: 0.90504*height), control1: CGPoint(x: 0.63574*width, y: 1.00298*height), control2: CGPoint(x: 0.26437*width, y: 0.7693*height))
        path.addCurve(to: CGPoint(x: 0.0344*width, y: 0.71101*height), control1: CGPoint(x: 0.07039*width, y: 1.04079*height), control2: CGPoint(x: 0.06129*width, y: 0.83965*height))
        path.addCurve(to: CGPoint(x: 0.13876*width, y: 0.43804*height), control1: CGPoint(x: 0.00751*width, y: 0.58237*height), control2: CGPoint(x: 0.06737*width, y: 0.45653*height))
        path.addCurve(to: CGPoint(x: 0.37474*width, y: 0.30357*height), control1: CGPoint(x: 0.21015*width, y: 0.41956*height), control2: CGPoint(x: 0.27875*width, y: 0.7303*height))
        path.closeSubpath()
        return path
    }
}

struct MaskBlur_Previews: PreviewProvider {
    static var previews: some View {
        MaskBlur()
    }
}
