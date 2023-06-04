//
//  BigShape.swift
//  Onboarding 1
//
//  Created by Sourany on 2021-04-01.
//

import SwiftUI

struct BigShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.20947*width, y: 0.19086*height))
        path.addCurve(to: CGPoint(x: -0.46652*width, y: 0.47062*height), control1: CGPoint(x: -0.11204*width, y: -0.22159*height), control2: CGPoint(x: -0.56395*width, y: 0.12437*height))
        path.addCurve(to: CGPoint(x: -0.07613*width, y: 0.74228*height), control1: CGPoint(x: -0.40248*width, y: 0.69822*height), control2: CGPoint(x: -0.28086*width, y: 0.80428*height))
        path.addCurve(to: CGPoint(x: 0.20947*width, y: 0.88991*height), control1: CGPoint(x: 0.09111*width, y: 0.69164*height), control2: CGPoint(x: 0.11481*width, y: 0.83491*height))
        path.addCurve(to: CGPoint(x: 0.6927*width, y: 0.97675*height), control1: CGPoint(x: 0.37598*width, y: 0.98665*height), control2: CGPoint(x: 0.44441*width, y: 0.87494*height))
        path.addCurve(to: CGPoint(x: 1.03511*width, y: 0.58659*height), control1: CGPoint(x: 0.941*width, y: 1.07856*height), control2: CGPoint(x: 1.05506*width, y: 0.79427*height))
        path.addCurve(to: CGPoint(x: 0.72204*width, y: 0.22329*height), control1: CGPoint(x: 1.01515*width, y: 0.37892*height), control2: CGPoint(x: 0.86565*width, y: 0.21547*height))
        path.addCurve(to: CGPoint(x: 0.20947*width, y: 0.19086*height), control1: CGPoint(x: 0.44067*width, y: 0.23861*height), control2: CGPoint(x: 0.42755*width, y: 0.47062*height))
        path.closeSubpath()
        return path
    }
}

struct BigShape_Previews: PreviewProvider {
    static var previews: some View {
        BigShape()
    }
}
