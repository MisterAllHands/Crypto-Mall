//
//  InsideFace1.swift
//  Background1
//
//  Created by Aksonvady Phomhome on 2021-04-02.
//

import SwiftUI

struct InsideFace1: View {
    var body: some View {
        Shape1()
            .fill(LinearGradient(
                        gradient: Gradient(stops: [
                    .init(color: Color(#colorLiteral(red: 0.17647063732147217, green: 0.11372548341751099, blue: 0.3803921639919281, alpha: 0)), location: 0.27231019735336304),
                    .init(color: Color(#colorLiteral(red: 0.18452909588813782, green: 0.1057184636592865, blue: 0.3716120421886444, alpha: 1)), location: 0.4682835042476654),
                    .init(color: Color(#colorLiteral(red: 0.2579030394554138, green: 0.03281250596046448, blue: 0.2916666567325592, alpha: 1)), location: 1)]),
                        startPoint: UnitPoint(x: -0.2225489079843291, y: 0.0008078229641721662),
                        endPoint: UnitPoint(x: -0.22254890798432894, y: 1.0226175180026396)))
            .frame(width: 374, height: 410, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .offset(x: 100, y: -10)
    }
}

struct InsideFace1_Previews: PreviewProvider {
    static var previews: some View {
        InsideFace1()
    }
}
