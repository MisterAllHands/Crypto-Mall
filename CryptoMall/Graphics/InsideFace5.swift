//
//  InsideFace5.swift
//  Background1
//
//  Created by Aksonvady Phomhome on 2021-04-02.
//

import SwiftUI

struct InsideFace5: View {
    var body: some View {
        Shape5()
            .fill(LinearGradient(
                    gradient: Gradient(stops: [
                .init(color: Color(#colorLiteral(red: 0.2196078598499298, green: 0.1607843041419983, blue: 0.24313727021217346, alpha: 0)), location: 0),
                .init(color: Color(#colorLiteral(red: 0.541176438331604, green: 0.29019612073898315, blue: 0.5411764979362488, alpha: 0.5)), location: 0.5089744329452515),
                .init(color: Color(#colorLiteral(red: 0.32156863808631897, green: 0.14901961386203766, blue: 0.6823529601097107, alpha: 1)), location: 1)]),
                    startPoint: UnitPoint(x: 0.45679454970553374, y: 0.06254354895469653),
                    endPoint: UnitPoint(x: 0.4567945497055338, y: 1.000000125722724)))
            .frame(width: 623, height: 346)
            .blendMode(.screen)
            .offset(x: -40, y: -20)
    }
}

struct InsideFace5_Previews: PreviewProvider {
    static var previews: some View {
        InsideFace5()
    }
}
