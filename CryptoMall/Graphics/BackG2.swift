//
//  BackG2.swift
//  Onboarding 1
//
//  Created by Sourany on 2021-04-01.
//

import SwiftUI

struct BackG2: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.49418*width, y: 0.31836*height))
        path.addCurve(to: CGPoint(x: 0.37471*width, y: 0.2028*height), control1: CGPoint(x: 0.44507*width, y: 0.26178*height), control2: CGPoint(x: 0.4206*width, y: 0.22289*height))
        path.addCurve(to: CGPoint(x: 0.19883*width, y: 0.01265*height), control1: CGPoint(x: 0.32883*width, y: 0.18271*height), control2: CGPoint(x: 0.31316*width, y: 0.03821*height))
        path.addCurve(to: CGPoint(x: 0, y: 0.02176*height), control1: CGPoint(x: 0.08449*width, y: -0.0129*height), control2: CGPoint(x: 0.00867*width, y: 0.00553*height))
        path.addCurve(to: CGPoint(x: 0, y: height), control1: CGPoint(x: 0, y: 0.10928*height), control2: CGPoint(x: 0, y: height))
        path.addLine(to: CGPoint(x: width, y: height))
        path.addLine(to: CGPoint(x: width, y: 0.55819*height))
        path.addCurve(to: CGPoint(x: 0.844*width, y: 0.51649*height), control1: CGPoint(x: width, y: 0.55819*height), control2: CGPoint(x: 0.87815*width, y: 0.53581*height))
        path.addCurve(to: CGPoint(x: 0.65524*width, y: 0.42251*height), control1: CGPoint(x: 0.80984*width, y: 0.49717*height), control2: CGPoint(x: 0.76041*width, y: 0.44305*height))
        path.addCurve(to: CGPoint(x: 0.49418*width, y: 0.31836*height), control1: CGPoint(x: 0.55007*width, y: 0.40197*height), control2: CGPoint(x: 0.51965*width, y: 0.34771*height))
        path.closeSubpath()
        return path
    }
}

struct BackG2_Previews: PreviewProvider {
    static var previews: some View {
        BackG2()
    }
}
