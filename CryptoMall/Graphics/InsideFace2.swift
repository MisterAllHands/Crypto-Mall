//
//  InsideFace2.swift
//  Background1
//
//  Created by Aksonvady Phomhome on 2021-04-02.
//

import SwiftUI

struct InsideFace2: View {
    var body: some View {
        Shape2()
            .fill(LinearGradient(
                    gradient: Gradient(stops: [
                .init(color: Color(#colorLiteral(red: 0.21568627655506134, green: 0.1568627506494522, blue: 0.23529411852359772, alpha: 1)), location: 0),
                .init(color: Color(#colorLiteral(red: 0.1409020721912384, green: 0.07772567868232727, blue: 0.5041666626930237, alpha: 1)), location: 1)]),
                    startPoint: UnitPoint(x: 0.5376673784609846, y: -0.0012964493985361404),
                    endPoint: UnitPoint(x: 0.5376673784609847, y: 1.3579519025026614)))
            .frame(width: 618, height: 308, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .offset(x: 10, y: -70)
    }
}

struct InsideFace2_Previews: PreviewProvider {
    static var previews: some View {
        InsideFace2()
    }
}
