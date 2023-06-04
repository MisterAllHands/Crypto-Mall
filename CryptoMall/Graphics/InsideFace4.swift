//
//  InsideFace4.swift
//  Background1
//
//  Created by Aksonvady Phomhome on 2021-04-02.
//

import SwiftUIX
import SwiftUI

struct InsideFace4: View {
    var body: some View {
        VStack {}
        .frame(width: 500, height: 400)
        .background(
            ZStack {
                LinearGradient(
                            gradient: Gradient(stops: [
                        .init(color: Color(#colorLiteral(red: 0.07450980392, green: 0.06666666667, blue: 0.5607843137, alpha: 1)), location: 0),
                        .init(color: Color(#colorLiteral(red: 0.4745098039, green: 0.262745098, blue: 0.4784313725, alpha: 1)), location: 0.3),
                        .init(color: Color(#colorLiteral(red: 0.9411764741, green: 0.5372549295, blue: 0.5764706135, alpha: 0)), location: 0.9542641639709473)]),
                            startPoint: UnitPoint(x: 0.4898819874462976, y: 0.7417796156406031),
                            endPoint: UnitPoint(x: 0.5000000373615463, y: 0.0736879187115217))
                
                VisualEffectBlurView(blurStyle: .systemUltraThinMaterial)
                    .opacity(0.2)
            }
        )
        .mask(Shape4())
            .blendMode(.overlay)
        .blur(radius: 20)
        .offset(x: -60, y: /*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/)
    }
}

struct InsideFace4_Previews: PreviewProvider {
    static var previews: some View {
        InsideFace4()
    }
}
