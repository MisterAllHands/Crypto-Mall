//
//  YellowPlanet.swift
//  Background1
//
//  Created by Aksonvady Phomhome on 2021-04-01.
//

import SwiftUIX
import SwiftUI

struct YellowPlanet: View {
    var body: some View {
        ZStack {
            Ellipse()
            .fill(LinearGradient(
                    gradient: Gradient(stops: [
                .init(color: Color(#colorLiteral(red: 0.9686274528503418, green: 0.8274509906768799, blue: 0.32549020648002625, alpha: 1)), location: 0),
                .init(color: Color(#colorLiteral(red: 0.9686274528503418, green: 0.8274511098861694, blue: 0.32549023628234863, alpha: 0.6000000238418579)), location: 0.44548100233078003),
                .init(color: Color(#colorLiteral(red: 0.7686274647712708, green: 0.7686274647712708, blue: 0.7686274647712708, alpha: 0)), location: 1)]),
                    startPoint: UnitPoint(x: 0.7405063701333071, y: 0.1518987525237192),
                    endPoint: UnitPoint(x: -0.20886079575690664, y: 1.202531751035755)))
                
                .overlay(
                    YShape1()
                        .fill(LinearGradient(
                                    gradient: Gradient(stops: [
                                .init(color: Color(#colorLiteral(red: 0.5166666507720947, green: 0.5085339546203613, blue: 0.48006942868232727, alpha: 1)), location: 0),
                                .init(color: Color(#colorLiteral(red: 0.9607843160629272, green: 0.8196078538894653, blue: 0.32549020648002625, alpha: 0)), location: 1)]),
                                    startPoint: UnitPoint(x: 0.9121951105393415, y: 0.2864440325967794),
                                    endPoint: UnitPoint(x: 0.10731706771485916, y: 0.6819087863392634)))
                        .frame(width: 110, height: 80)
                        .blendMode(.screen)
                        .offset(x: -3, y: 15)
                )
                .overlay(
                    YShape2()
                        .fill(Color(#colorLiteral(red: 0.9607843160629272, green: 0.8196078538894653, blue: 0.32549020648002625, alpha: 1)))
                        .frame(width: 110, height: 74)
                        .blendMode(.colorBurn)
                        .offset(x: -3, y: -4)
                )
                .overlay(
                    YShape1()
                        .fill(LinearGradient(
                                    gradient: Gradient(stops: [
                                .init(color: Color(#colorLiteral(red: 0.5166666507720947, green: 0.5085339546203613, blue: 0.48006942868232727, alpha: 1)), location: 0),
                                .init(color: Color(#colorLiteral(red: 0.9607843160629272, green: 0.8196078538894653, blue: 0.32549020648002625, alpha: 0)), location: 1)]),
                                    startPoint: UnitPoint(x: 0.9121951105393415, y: 0.2864440325967794),
                                    endPoint: UnitPoint(x: 0.10731706771485916, y: 0.6819087863392634)))
                        .frame(width: 110, height: 80)
                        .blendMode(.screen)
                        .offset(x: -3, y: 75)
                )
                
                
                .mask(Ellipse().frame(width: 107.8, height: 107.8))
                .frame(width: 107.8, height: 107.8)
                .offset(x: 30, y: -200)
            
            VStack {}
            .frame(width: 90, height: 90)
            .background(
                ZStack {
                    Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.5))
                    VisualEffectBlurView(blurStyle: .dark)
                        .opacity(0.5)
                }
            )
            .mask(Circle())
            .blur(radius: 15)
            .offset(x: 15, y: -185)
        }
    }
}

struct YellowPlanet_Previews: PreviewProvider {
    static var previews: some View {
        YellowPlanet()
    }
}
