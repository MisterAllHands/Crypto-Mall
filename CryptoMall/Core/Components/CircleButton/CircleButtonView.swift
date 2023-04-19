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
            .foregroundColor(Color.theme.accentColor.opacity(1.2))
            .frame(width: 50, height: 50)
            .background(
                Circle()
                    .foregroundColor(Color.theme.background)
                
            )
            .shadow(color: Color.theme.accentColor.opacity(0.35), radius: 10, x: 0, y: 0)
            .padding()
    }
}

struct CircleButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CircleButtonView(buttonName: "hamburgerMenu")
                .previewLayout(.sizeThatFits)
    }
}
