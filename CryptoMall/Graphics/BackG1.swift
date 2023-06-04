//
//  BackG1.swift
//  Onboarding 1
//
//  Created by Sourany on 2021-04-01.
//

import SwiftUI

struct BackG1: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.67289*width, y: 0.39709*height))
        path.addCurve(to: CGPoint(x: 0.59151*width, y: 0.33268*height), control1: CGPoint(x: 0.64398*width, y: 0.38767*height), control2: CGPoint(x: 0.62364*width, y: 0.37634*height))
        path.addCurve(to: CGPoint(x: 0.46612*width, y: 0.24326*height), control1: CGPoint(x: 0.55138*width, y: 0.27813*height), control2: CGPoint(x: 0.52831*width, y: 0.24326*height))
        path.addCurve(to: CGPoint(x: 0.32666*width, y: 0.13007*height), control1: CGPoint(x: 0.40394*width, y: 0.24326*height), control2: CGPoint(x: 0.3708*width, y: 0.171*height))
        path.addCurve(to: CGPoint(x: 0.21559*width, y: 0.02501*height), control1: CGPoint(x: 0.29107*width, y: 0.09707*height), control2: CGPoint(x: 0.28341*width, y: 0.05003*height))
        path.addCurve(to: CGPoint(x: 0, y: 0), control1: CGPoint(x: 0.14778*width, y: 0), control2: CGPoint(x: 0, y: 0))
        path.addCurve(to: CGPoint(x: 0, y: height), control1: CGPoint(x: 0, y: 0.10859*height), control2: CGPoint(x: 0, y: height))
        path.addLine(to: CGPoint(x: width, y: height))
        path.addLine(to: CGPoint(x: width, y: 0.5578*height))
        path.addCurve(to: CGPoint(x: 0.77679*width, y: 0.49277*height), control1: CGPoint(x: width, y: 0.5578*height), control2: CGPoint(x: 0.80622*width, y: 0.50277*height))
        path.addCurve(to: CGPoint(x: 0.72024*width, y: 0.48214*height), control1: CGPoint(x: 0.74736*width, y: 0.48276*height), control2: CGPoint(x: 0.73845*width, y: 0.50491*height))
        path.addCurve(to: CGPoint(x: 0.67289*width, y: 0.39709*height), control1: CGPoint(x: 0.6991*width, y: 0.45571*height), control2: CGPoint(x: 0.70181*width, y: 0.40651*height))
        path.closeSubpath()
        return path
    }
}

struct BackG1_Previews: PreviewProvider {
    static var previews: some View {
        BackG1()
    }
}
