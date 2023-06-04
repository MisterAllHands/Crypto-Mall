//
//  CryptoLogoView.swift
//  CryptoMall
//
//  Created by TTGMOTSF on 09/04/2023.
//

import SwiftUI

struct CryptoLogoView: View {
    
    let crypto: CryptoModel
    
    var body: some View {
        VStack {
            CryptoImageView(crypto: crypto)
                .frame(width: 50, height: 50)
            Text(crypto.symbol.uppercased())
                .font(.custom("Kanit-SemoBold", size: 15))
                .foregroundColor(Color.theme.accentColor)
                .lineLimit(1)
                .minimumScaleFactor(0.5)
            Text(crypto.name)
                .font(.custom("Kanit-ExtraLight", size: 10))
                .foregroundColor(Color.theme.secondaryText)
                .lineLimit(2)
                .minimumScaleFactor(0.5)
                .multilineTextAlignment(.center )
        }
    }
}

struct CryptoLogoView_Previews: PreviewProvider {
    static var previews: some View {
        CryptoLogoView(crypto: dev.crypto)
            .previewLayout(.sizeThatFits)
    }
}
