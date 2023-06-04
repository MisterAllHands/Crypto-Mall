//
//  InsideFace3.swift
//  Background1
//
//  Created by Aksonvady Phomhome on 2021-04-02.
//

import SwiftUI

struct InsideFace3: View {
    var body: some View {
        Shape3()
            .fill(LinearGradient(
                        gradient: Gradient(stops: [
                    .init(color: Color(#colorLiteral(red: 0.9949479103088379, green: 0.19671881198883057, blue: 0.7714440822601318, alpha: 1)), location: 0.16872821748256683),
                    .init(color: Color(#colorLiteral(red: 0.6509804129600525, green: 0.5803921818733215, blue: 1, alpha: 0)), location: 0.8059566020965576)]),
                        startPoint: UnitPoint(x: 0.4999999999999999, y: 0.9999999403953553),
                        endPoint: UnitPoint(x: 0.49999999999999994, y: -5.960464466436832e-8)))
            .frame(width: 599, height: 427)
            .opacity(0.4)
            .blendMode(.screen)
            .offset(x: -12, y: -10)
    }
}

struct InsideFace3_Previews: PreviewProvider {
    static var previews: some View {
        InsideFace3()
    }
}
