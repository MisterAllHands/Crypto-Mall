//
//  RedPlanet.swift
//  Background1
//
//  Created by Aksonvady Phomhome on 2021-04-01.
//

import SwiftUIX
import SwiftUI

struct RedPlanet: View {
    var body: some View {
        ZStack{
            Ellipse()
                .fill(LinearGradient(
                        gradient: Gradient(stops: [
                    .init(color: Color(#colorLiteral(red: 0.8784313797950745, green: 0.41960784792900085, blue: 0.3764705955982208, alpha: 1)), location: 0),
                    .init(color: Color(#colorLiteral(red: 0.7686274647712708, green: 0.7686274647712708, blue: 0.7686274647712708, alpha: 0)), location: 1)]),
                        startPoint: UnitPoint(x: 0.5000000242277873, y: 1.1899489005262609e-8),
                        endPoint: UnitPoint(x: 0.10071942937516931, y: 0.8129496536271666)))
            .frame(width: 94.8, height: 94.9)
                .offset(x: -200, y: -180)
            
            VStack {}
            .frame(width: 88, height: 88)
            .background(
                ZStack {
                    Color(#colorLiteral(red: 0.7016654611, green: 0.1990799904, blue: 0.2024365664, alpha: 0.5035404079))
                    VisualEffectBlurView(blurStyle: .regular)
                        .opacity(0.4)
                }
            )
            .mask(Circle())
            .blur(radius: 10)
            .offset(x: -200, y: -175)
            
            LinearGradient(
                        gradient: Gradient(stops: [
                    .init(color: Color(#colorLiteral(red: 0.8784313797950745, green: 0.41960784792900085, blue: 0.3764705955982208, alpha: 1)), location: 0),
                    .init(color: Color(#colorLiteral(red: 0.7686274647712708, green: 0.7686274647712708, blue: 0.7686274647712708, alpha: 0)), location: 1)]),
                        startPoint: UnitPoint(x: 0.42562037283371257, y: 0.1079455755207874),
                        endPoint: UnitPoint(x: 0.3705400843066716, y: 1.160415068276743))
                .mask(SaturnRing())
                .frame(width: 200, height: 55)
                .offset(x: -194.2, y: -185.5)
        }
    }
}

struct RedPlanet_Previews: PreviewProvider {
    static var previews: some View {
        RedPlanet()
    }
}
