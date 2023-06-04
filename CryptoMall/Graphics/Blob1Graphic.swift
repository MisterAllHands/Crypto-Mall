//
//  Blob1Graphic.swift
//  DesignCodeUniversal
//
//  Created by Meng To on 2021-04-08.
//

import SwiftUI

struct Blob1Graphic: View {
    @State var appear = false
    @Binding var selection: Int
    @State var active = true
    
    var body: some View {
        ZStack {
            LinearGradient(
                        gradient: Gradient(stops: [
                    .init(color: Color(#colorLiteral(red: 0.050347208976745605, green: 0.14063718914985657, blue: 0.4166666567325592, alpha: 1)), location: 0),
                    .init(color: Color(#colorLiteral(red: 0.8833333253860474, green: 0.2834027409553528, blue: 0.5233750343322754, alpha: 1)), location: 0.5409181714057922),
                    .init(color: Color(#colorLiteral(red: 0.9843137264251709, green: 0.545098066329956, blue: 0.545098066329956, alpha: 1)), location: 1)]),
                        startPoint: UnitPoint(x: 0.5, y: -8.040613114788646e-17),
                endPoint: UnitPoint(x: 0.5, y: 0.9999999999999999)).ignoresSafeArea()
            
            GlobeShape()
                .fill(RadialGradient(
                    gradient: Gradient(stops: [
                                        .init(color: Color(#colorLiteral(red: 0.9098039269447327, green: 0.2235294133424759, blue: 0.6509804129600525, alpha: 1)), location: 0),
                                        .init(color: Color(#colorLiteral(red: 0.9803921580314636, green: 0.9176470637321472, blue: 0.6470588445663452, alpha: 1)), location: 0.9780701994895935)]),
                    center: UnitPoint(x: 0.466398182976454, y: 0.5695231060388317),
                    startRadius: 2.041053227179221,
                    endRadius: 149.38707692701118
                )).opacity(0.5)
                .frame(width: 569, height: 289.85)
                .offset(x: appear ? 60 : 0, y: -190)
            
            Circle()
                .fill(RadialGradient(
                    gradient: Gradient(stops: [
                                        .init(color: Color(#colorLiteral(red: 0.9098039269447327, green: 0.2235294133424759, blue: 0.6509804129600525, alpha: 1)), location: 0),
                                        .init(color: Color(#colorLiteral(red: 0.9795185924, green: 0.9158585668, blue: 0.6477716565, alpha: 1)), location: 0.9780701994895935)]),
                    center: UnitPoint(x: 0.31886224340913316, y: 0.4386227577534223),
                    startRadius: 1.4844146370558098,
                    endRadius: 148.4514826684042
                )).opacity(0.9)
                .frame(width: 312, height: 312)
                .offset(x: 10.0, y: -200)
                .scaleEffect(appear ? 1 : 0.8)
            
            Circle()
                .fill(RadialGradient(
                    gradient: Gradient(stops: [
                                        .init(color: Color(#colorLiteral(red: 0.9098039269447327, green: 0.2235294133424759, blue: 0.6509804129600525, alpha: 1)), location: 0),
                                        .init(color: Color(#colorLiteral(red: 0.9795185924, green: 0.9158585668, blue: 0.6477716565, alpha: 1)), location: 0.9780701994895935)]),
                    center: UnitPoint(x: 0.31886224340913316, y: 0.4386227577534223),
                    startRadius: 1.4844146370558098,
                    endRadius: 148.4514826684042
                ))
                .frame(width: 227, height: 227)
                .offset(x: appear ? 90 : 180, y: -195)
            
            Circle()
                .fill(RadialGradient(
                    gradient: Gradient(stops: [
                                        .init(color: Color(#colorLiteral(red: 0.125, green: 0.9475000500679016, blue: 1, alpha: 1)), location: 0),
                                        .init(color: Color(#colorLiteral(red: 0.7760988473892212, green: 0.32083332538604736, blue: 1, alpha: 1)), location: 0.9780701994895935)]),
                    center: UnitPoint(x: 0.8045112209993526, y: 0.46867171552365405),
                    startRadius: 1.54594135705969,
                    endRadius: 154.594135705969
                )).opacity(0.5)
                .frame(width: 135, height: 135)
                .blur(radius: 30)
                .offset(x: 120, y: -195)
            
            Ellipse()
                .fill(LinearGradient(
                        gradient: Gradient(stops: [
                                            .init(color: Color(#colorLiteral(red: 0.9764705896, green: 0.8941176534, blue: 0.650980413, alpha: 0)), location: 0),
                                            .init(color: Color(#colorLiteral(red: 0.8119434118270874, green: 0.5162400007247925, blue: 0.6073760390281677, alpha: 1)), location: 0.14624865353107452),
                                            .init(color: Color(#colorLiteral(red: 0.9137254953384399, green: 0.43921568989753723, blue: 0.6431372761726379, alpha: 1)), location: 1)]),
                        startPoint: UnitPoint(x: 0.5, y: 2.2946122541118996e-17),
                        endPoint: UnitPoint(x: 0.4999999999999998, y: 1)))
                .frame(width: 252, height: 169)
                .offset(x: -50, y: -285)
                .blur(radius: 30)
            
            Shape04()
                .fill(RadialGradient(
                    gradient: Gradient(stops: [
                                        .init(color: Color(#colorLiteral(red: 0.9098039269447327, green: 0.2235294133424759, blue: 0.6509804129600525, alpha: 1)), location: 0),
                                        .init(color: Color(#colorLiteral(red: 0.9803921580314636, green: 0.9176470637321472, blue: 0.6470588445663452, alpha: 1)), location: 0.9780701994895935)]),
                    center: UnitPoint(x: 0.5006409493307477, y: 0.5001085263140381),
                    startRadius: 1.1845956776855486,
                    endRadius: 103.11263397768715
                )).opacity(0.5)
                .frame(width: 106.64, height: 55.28, alignment: .center)
                .offset(x: 250, y: -315)
        }
        .opacity(active ? 1 : 0)
        .onAppear(perform: {
            update()
        })
        .onChange(of: selection, perform: { value in
            update()
        })
    }
    
    func update() {
        if selection == 1 {
            withAnimation {
                active = true
            }
            withAnimation(.easeOut(duration: 10)) {
                appear = true
            }
        } else {
            withAnimation {
                active = false
                appear = false
            }
        }
    }
}

struct Blob1Graphic_Previews: PreviewProvider {
    static var previews: some View {
        Blob1Graphic(selection: .constant(1))
    }
}
