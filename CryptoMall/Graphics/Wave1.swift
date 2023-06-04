//
//  Wave2.swift
//  Background1
//
//  Created by Aksonvady Phomhome on 2021-04-02.
//

import SwiftUI

struct Wave1: View {
    var body: some View {
        LinearGradient(
                    gradient: Gradient(stops: [
                .init(color: Color(#colorLiteral(red: 1, green: 0.14166665077209473, blue: 0.14166665077209473, alpha: 1)), location: 0),
                .init(color: Color(#colorLiteral(red: 0.7583333253860474, green: 0.20222222805023193, blue: 0.477153480052948, alpha: 1)), location: 0.48761284351348877),
                .init(color: Color(#colorLiteral(red: 0.3529411852359772, green: 0.23529411852359772, blue: 0.4627451002597809, alpha: 1)), location: 1)]),
                    startPoint: UnitPoint(x: 0.6633066204816261, y: 0.3170961727150654),
                    endPoint: UnitPoint(x: 0.6303716612757082, y: 0.7061377283647647))
            .mask(wave1().frame(width: 1937, height: 725))
//            .frame(width: 1937, height: 725, alignment: .bottom)
            .offset(x: 0, y: 400)
    }
}

struct Wave1_Previews: PreviewProvider {
    static var previews: some View {
        Wave1()
    }
}

struct wave1: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 1.00052*width, y: 1.15353*height))
        path.addLine(to: CGPoint(x: -0.00664*width, y: 1.15353*height))
        path.addLine(to: CGPoint(x: -0.00664*width, y: 0.02544*height))
        path.addCurve(to: CGPoint(x: 0.48359*width, y: 0.13672*height), control1: CGPoint(x: 0.23646*width, y: -0.06041*height), control2: CGPoint(x: 0.41458*width, y: 0.10493*height))
        path.addCurve(to: CGPoint(x: 0.59661*width, y: 0.27027*height), control1: CGPoint(x: 0.5526*width, y: 0.16852*height), control2: CGPoint(x: 0.5604*width, y: 0.22832*height))
        path.addCurve(to: CGPoint(x: 0.73854*width, y: 0.41415*height), control1: CGPoint(x: 0.64153*width, y: 0.3223*height), control2: CGPoint(x: 0.67526*width, y: 0.41415*height))
        path.addCurve(to: CGPoint(x: 0.86615*width, y: 0.52782*height), control1: CGPoint(x: 0.80182*width, y: 0.41415*height), control2: CGPoint(x: 0.8253*width, y: 0.45848*height))
        path.addCurve(to: CGPoint(x: 0.94896*width, y: 0.6097*height), control1: CGPoint(x: 0.89884*width, y: 0.58332*height), control2: CGPoint(x: 0.91953*width, y: 0.59773*height))
        path.addCurve(to: CGPoint(x: 1.00208*width, y: 0.71701*height), control1: CGPoint(x: 0.97839*width, y: 0.62167*height), control2: CGPoint(x: 0.98058*width, y: 0.68341*height))
        path.addLine(to: CGPoint(x: 1.00052*width, y: 1.15353*height))
        path.closeSubpath()
        return path
    }
}
