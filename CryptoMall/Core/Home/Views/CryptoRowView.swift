//
//  CryptoRowView.swift
//  CryptoMall
//
//  Created by TTGMOTSF on 07/04/2023.
//

import SwiftUI

struct CryptoRowView: View {
    
    let crypto: CryptoModel
    let showHoldingColumn: Bool
    
    var body: some View {
        HStack(spacing: 0) {
            leftColum
            Spacer()
            if showHoldingColumn {
                centerColum
            }
            rightColum
        }
        .frame(width: UIScreen.main.bounds.width / 1.04, height: 100)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color(.systemGray5), lineWidth: 1)
        )
        .font(.subheadline)
        .background(
            Color.theme.background.opacity(0.001)
        )
    }
}

struct CryptoRowView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            CryptoRowView(crypto: dev.crypto, showHoldingColumn: true)
        }
    }
}

//MARK: - Colums

extension CryptoRowView {
    
    private var leftColum: some View {
        HStack(spacing: 0) {
            Text("\(crypto.rank)")
                .font(.caption)
                .foregroundColor(Color.theme.secondaryText)
                .frame(minWidth: 30)
            CryptoImageView(crypto: crypto)
                .frame(width: 40, height: 40)
                
            Text("\(crypto.symbol.uppercased())")
                .font(.headline)
                .fontWeight(.semibold)
                .padding(.leading, 6)
                .foregroundColor(Color.theme.accentColor)
        }
    }
    
    private var centerColum: some View {
        VStack(alignment: .trailing, spacing: 5){
            Text(crypto.currentHoldingsvalue.asCurrencyWith2Decimals())
                .bold()
            Text((crypto.currentHoldings ?? 0).asNumberString())
        }
        .foregroundColor(Color.theme.accentColor)
    }
    
    private var rightColum: some View {
        VStack(alignment: .trailing , spacing: 5) {
            Text(crypto.currentPrice.asCurrencyWith6Decimals())
                .bold()
                .foregroundColor(Color.theme.accentColor)
            Text(crypto.priceChangePercentage24H?.aspercentString() ?? "")
                .foregroundColor(
                    (crypto.priceChangePercentage24H ?? 0) >= 0 ? Color.theme.green : Color.theme.red
                )
        }
        .frame(width: UIScreen.main.bounds.width / 3.5 , alignment: .trailing)
        .padding()
    }
}
