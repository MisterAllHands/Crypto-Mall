//
//  BoomerangRight.swift
//  Onboarding 1
//
//  Created by Sourany on 2021-04-01.
//

import SwiftUI

struct BoomerangRight: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.32364*width, y: 0.76997*height))
        path.addCurve(to: CGPoint(x: 0.06072*width, y: 0.97573*height), control1: CGPoint(x: 0.26892*width, y: 1.0196*height), control2: CGPoint(x: 0.11357*width, y: 1.011*height))
        path.addCurve(to: CGPoint(x: 0.08778*width, y: 0.52893*height), control1: CGPoint(x: -0.08621*width, y: 0.82876*height), control2: CGPoint(x: 0.0785*width, y: 0.6418*height))
        path.addCurve(to: CGPoint(x: 0.12645*width, y: 0.05273*height), control1: CGPoint(x: 0.09938*width, y: 0.38783*height), control2: CGPoint(x: 0.03366*width, y: 0.16443*height))
        path.addCurve(to: CGPoint(x: 0.45898*width, y: 0.18206*height), control1: CGPoint(x: 0.21925*width, y: -0.05897*height), control2: CGPoint(x: 0.35071*width, y: 0.01745*height))
        path.addCurve(to: CGPoint(x: 0.8147*width, y: 0.25849*height), control1: CGPoint(x: 0.56724*width, y: 0.34668*height), control2: CGPoint(x: 0.56724*width, y: 0.26437*height))
        path.addCurve(to: CGPoint(x: 0.96549*width, y: 0.60536*height), control1: CGPoint(x: 1.01266*width, y: 0.25379*height), control2: CGPoint(x: 1.02735*width, y: 0.49114*height))
        path.addCurve(to: CGPoint(x: 0.6639*width, y: 0.66414*height), control1: CGPoint(x: 0.91136*width, y: 0.7053*height), control2: CGPoint(x: 0.8031*width, y: 0.80054*height))
        path.addCurve(to: CGPoint(x: 0.32364*width, y: 0.76997*height), control1: CGPoint(x: 0.48991*width, y: 0.49365*height), control2: CGPoint(x: 0.38937*width, y: 0.47015*height))
        path.closeSubpath()
        return path
    }
}


struct BoomerangRight_Previews: PreviewProvider {
    static var previews: some View {
        BoomerangRight()
    }
}
