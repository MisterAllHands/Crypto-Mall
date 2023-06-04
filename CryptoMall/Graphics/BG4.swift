//
//  BG4.swift
//  Onboarding 1
//
//  Created by Sourany on 2021-04-01.
//

import SwiftUI

struct BG4: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.7684*width, y: 0.29652*height))
        path.addCurve(to: CGPoint(x: 0.61145*width, y: 0.29652*height), control1: CGPoint(x: 0.70808*width, y: 0.31696*height), control2: CGPoint(x: 0.69939*width, y: 0.31629*height))
        path.addCurve(to: CGPoint(x: 0.43405*width, y: 0.30752*height), control1: CGPoint(x: 0.52352*width, y: 0.27675*height), control2: CGPoint(x: 0.49565*width, y: 0.38142*height))
        path.addCurve(to: CGPoint(x: 0, y: 0.00249*height), control1: CGPoint(x: 0.37244*width, y: 0.23362*height), control2: CGPoint(x: 0.03997*width, y: -0.02822*height))
        path.addCurve(to: CGPoint(x: 0, y: 0.99932*height), control1: CGPoint(x: 0, y: 0.139*height), control2: CGPoint(x: 0, y: 0.99932*height))
        path.addLine(to: CGPoint(x: 0.99993*width, y: 0.99932*height))
        path.addLine(to: CGPoint(x: 0.99993*width, y: 0.35784*height))
        path.addCurve(to: CGPoint(x: 0.7684*width, y: 0.29652*height), control1: CGPoint(x: 0.99993*width, y: 0.35784*height), control2: CGPoint(x: 0.82873*width, y: 0.27608*height))
        path.closeSubpath()
        return path
    }
}

struct BG4_Previews: PreviewProvider {
    static var previews: some View {
        BG4()
    }
}
