//
//  BoomerangLeftTop.swift
//  Onboarding 1
//
//  Created by Sourany on 2021-04-01.
//

import SwiftUI

struct BoomerangLeftTop: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.32364*width, y: 0.22407*height))
        path.addCurve(to: CGPoint(x: 0.06072*width, y: 0.01831*height), control1: CGPoint(x: 0.26892*width, y: -0.02556*height), control2: CGPoint(x: 0.11357*width, y: -0.01696*height))
        path.addCurve(to: CGPoint(x: 0.08778*width, y: 0.46511*height), control1: CGPoint(x: -0.08621*width, y: 0.16529*height), control2: CGPoint(x: 0.0785*width, y: 0.35224*height))
        path.addCurve(to: CGPoint(x: 0.12645*width, y: 0.94131*height), control1: CGPoint(x: 0.09938*width, y: 0.60621*height), control2: CGPoint(x: 0.03366*width, y: 0.82961*height))
        path.addCurve(to: CGPoint(x: 0.45898*width, y: 0.81198*height), control1: CGPoint(x: 0.21925*width, y: 1.05301*height), control2: CGPoint(x: 0.35071*width, y: 0.97659*height))
        path.addCurve(to: CGPoint(x: 0.8147*width, y: 0.73555*height), control1: CGPoint(x: 0.56724*width, y: 0.64736*height), control2: CGPoint(x: 0.56724*width, y: 0.72967*height))
        path.addCurve(to: CGPoint(x: 0.96549*width, y: 0.38868*height), control1: CGPoint(x: 1.01266*width, y: 0.74025*height), control2: CGPoint(x: 1.02735*width, y: 0.5029*height))
        path.addCurve(to: CGPoint(x: 0.6639*width, y: 0.3299*height), control1: CGPoint(x: 0.91136*width, y: 0.28874*height), control2: CGPoint(x: 0.8031*width, y: 0.1935*height))
        path.addCurve(to: CGPoint(x: 0.32364*width, y: 0.22407*height), control1: CGPoint(x: 0.48991*width, y: 0.50039*height), control2: CGPoint(x: 0.38937*width, y: 0.52389*height))
        path.closeSubpath()
        return path
    }
}


struct BoomerangLeftTop_Previews: PreviewProvider {
    static var previews: some View {
        BoomerangLeftTop()
    }
}
