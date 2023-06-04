////
////  CryptoRowView.swift
////  CryptoMall
////
////  Created by TTGMOTSF on 07/04/2023.
////
//
import SwiftUI
import SwiftUI_Shimmer


struct CryptoRowView: View {

    @EnvironmentObject private var vm: HomeViewModel
    let crypto: CryptoModel
    let showHoldingColumn: Bool
    private let backgroundLayer = Backgroundlayer()

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
        .font(.subheadline)
        .background(
            .clear
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
            CryptoImageView(crypto: crypto)
                .frame(width: 35, height: 35)

            VStack(alignment: .leading) {
                Text("\(crypto.name.uppercased())")
                    .font(.custom("Kanit-SemiBold", size: 15))
                Text("\(crypto.symbol.uppercased())")
                    .font(.custom("Kanit-ExtraLight", size: 15))
                .foregroundColor(Color.white)
            }
            .padding(.leading, 6)
        }
    }

    private var centerColum: some View {
        VStack(alignment: .trailing, spacing: 5){
            Text(crypto.currentHoldingsvalue.asCurrencyWith2Decimals())
                .font(.custom("Kanit-SemiBold", size: 17))
                .lineLimit(1)
            Text((crypto.currentHoldings ?? 0).asNumberString())
                .font(.custom("Kanit-ExtraLight", size: 13))
        }
        .foregroundColor(Color.white)
    }

    private var rightColum: some View {
        VStack(alignment: .trailing , spacing: 5) {
            Text(crypto.currentPrice.asCurrencyWith6Decimals())
                .font(.custom("Kanit-SemiBold", size: 17))
                .lineLimit(1)
                .foregroundColor(Color.white)
            Text(crypto.priceChangePercentage24H?.aspercentString() ?? "")
                .font(.custom("Kanit-ExtraLight", size: 13))
                .foregroundColor(
                    (crypto.priceChangePercentage24H ?? 0) >= 0 ? Color.theme.green : Color.theme.red
                )
        }
        .frame(width: UIScreen.main.bounds.width / 3.5 , alignment: .trailing)
        .padding()
    }
}
