//
//  Blob3Graphic.swift
//  DesignCodeUniversal
//
//  Created by Meng To on 2021-04-08.
//

import SwiftUI

struct Blob3Graphic: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(colorScheme == .dark ? #colorLiteral(red: 0.1647058824, green: 0.0431372549, blue: 0.4156862745, alpha: 1) : #colorLiteral(red: 0.2078431397676468, green: 0.24313725531101227, blue: 0.843137264251709, alpha: 1)), Color(#colorLiteral(red: 0.2862745098, green: 0.1490196078, blue: 0.6784313725, alpha: 1))]), startPoint: .top, endPoint: .bottom).ignoresSafeArea()
            
            LinearGradient(
                        gradient: Gradient(stops: [
                    .init(color: Color(#colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)), location: 0),
                    .init(color: Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)), location: 1)]),
                        startPoint: UnitPoint(x: 0.6135602287845842, y: 0.5022584295142866),
                        endPoint: UnitPoint(x: 0.6380312747747834, y: 0.3761707937578225))
                .frame(width: 1962, height: 983)
                .mask(BackG2())
                .offset(x: 60, y: 100)
                .blur(radius: 50)
            
            if colorScheme == .dark {
                Stars().offset(y: -500)
            }
           
            LinearGradient(
                gradient: Gradient(stops: [
                                    .init(color: Color(#colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)), location: 0),
                                    .init(color: Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)), location: 0.48761284351348877),
                                    .init(color: Color(#colorLiteral(red: 0.3529411852359772, green: 0.23529411852359772, blue: 0.4627451002597809, alpha: 1)), location: 1)]),
                startPoint: UnitPoint(x: 0.5727748860771233, y: 0.12695962323708468),
                endPoint: UnitPoint(x: 0.48781673508811185, y: 0.9387186317990575))
                .frame(width: 1954, height: 800)
                .mask(BackG1())
                .offset(x: 30, y: 185)
        }
    }
}

struct Blob3Graphic_Previews: PreviewProvider {
    static var previews: some View {
        Blob3Graphic()
            .environment(\.colorScheme, .light)
    }
}
