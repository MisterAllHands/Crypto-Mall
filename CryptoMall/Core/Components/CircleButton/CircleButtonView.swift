//
//  CircleButtonView.swift
//  CryptoMall
//
//  Created by TTGMOTSF on 06/04/2023.
//

import SwiftUI

struct CircleButtonView: View {
    
    let buttonName: String
    
    var body: some View {
        Image(systemName: buttonName)
            .renderingMode(.template)
            .font(.headline)
            .foregroundColor(Color.white.opacity(1.2))
            .frame(width: 50, height: 50)
            .background(
                Circle()
                    .fill(
                        RadialGradient(
                                    gradient: Gradient(stops: [
                                .init(color: Color(#colorLiteral(red: 0, green: 0.20555543899536133, blue: 1, alpha: 0.4399999976158142)), location: 0),
                                .init(color: Color(#colorLiteral(red: 0, green: 0.20392157137393951, blue: 1, alpha: 0)), location: 1)]),
                                    center: UnitPoint(x: 0.50, y: -2.0019999999999994),
                                    startRadius: 15,
                                    endRadius: 170
                        )
                    )
                
            )
            .shadow(color: Color.white.opacity(0.85), radius: 25, x: 0, y: 0)
            .padding()
    }
}

struct CircleButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CircleButtonView(buttonName: "hamburgerMenu")
                .previewLayout(.sizeThatFits)
    }
}
