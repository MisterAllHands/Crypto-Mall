//
//  PurplePlanet.swift
//  Background1
//
//  Created by Aksonvady Phomhome on 2021-04-01.
//

import SwiftUIX
import SwiftUI

struct PurplePlanet: View {
    var body: some View {
        ZStack {
            Ellipse()
            .fill(LinearGradient(
                    gradient: Gradient(stops: [
                .init(color: Color(#colorLiteral(red: 0.32549023628234863, green: 0.5827450752258301, blue: 0.9686274528503418, alpha: 0.6000000238418579)), location: 0),
                .init(color: Color(#colorLiteral(red: 0.45085445046424866, green: 0, blue: 0.8791666626930237, alpha: 1)), location: 0.569564700126648),
                .init(color: Color(#colorLiteral(red: 0.7686274647712708, green: 0.7686274647712708, blue: 0.7686274647712708, alpha: 0)), location: 1)]),
                    startPoint: UnitPoint(x: 0.7405063701333071, y: 0.1518987525237192),
                    endPoint: UnitPoint(x: -0.20886079575690664, y: 1.202531751035755)))
                
                .overlay(
                    YShape1()
                        .fill(LinearGradient(
                                    gradient: Gradient(stops: [
                                .init(color: Color(#colorLiteral(red: 0.49837779998779297, green: 0.35305556654930115, blue: 0.6833333373069763, alpha: 1)), location: 0),
                                .init(color: Color(#colorLiteral(red: 0.4144313335418701, green: 0.32549023628234863, blue: 0.9607843160629272, alpha: 0)), location: 1)]),
                                    startPoint: UnitPoint(x: 0.9121950814151141, y: 0.2864440735642143),
                                    endPoint: UnitPoint(x: 0.10731704880226633, y: 0.6819088121486074)))
                        .frame(width: 223, height: 127)
                        .blendMode(.screen)
                        .offset(x: -3, y: 15)
                )
                .overlay(
                    YShape2()
                        .fill(Color(#colorLiteral(red: 0.4144313335418701, green: 0.32549023628234863, blue: 0.9607843160629272, alpha: 1)))
                        .frame(width: 223, height: 118)
                        .blendMode(.softLight)
                        .offset(x: -3, y: -4)
                )
                .overlay(
                    YShape1()
                        .fill(Color(#colorLiteral(red: 0.2705882489681244, green: 0.1568627506494522, blue: 0.1568627506494522, alpha: 1)))
                        .frame(width: 223, height: 127)
                        .offset(x: -3, y: 60)
                )
                
                
                .mask(Ellipse().frame(width: 172, height: 172))
                .frame(width: 172, height: 172)
                .offset(x: -105, y: -330)
                .opacity(0.3)
            
            VStack {}
                .frame(width: 140.4, height: 140.4)
            .background(
                ZStack {
                    Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.20999999344348907))
                    VisualEffectBlurView(blurStyle: .dark)
                        .opacity(0.4)
                }
            )
            .mask(Circle())
            .blur(radius: 20)
            .offset(x: -110, y: -300)
        }
    }
}

struct PurplePlanet_Previews: PreviewProvider {
    static var previews: some View {
        PurplePlanet()
    }
}
