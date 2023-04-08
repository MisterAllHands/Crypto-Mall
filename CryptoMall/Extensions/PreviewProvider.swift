//
//  PreviewProvider.swift
//  CryptoMall
//
//  Created by TTGMOTSF on 07/04/2023.
//

import Foundation
import SwiftUI


class DeveloperPreview {
    static let instance = DeveloperPreview()
    private init() { }
    
    let homeVM = HomeViewModel()
    
    let crypto = CryptoModel(
        
        id: "bitcoin",
        symbol: "btc",
        name: "Bitcoin",
        image: "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579",
        currentPrice : 27872,
        marketCap : 538926897345,
        marketCapRank : 1,
        fullyDilutedValuation : 585200029114,
        totalVolume: 12351112037,
        high24H: 28185,
        low24H: 27845,
        priceChange24H: -35.166800307895755,
        priceChangePercentage24H: -0.12601,
        marketCapChange24H: -1305826605.5770264,
        marketCapChangePercentage24H: -0.24172,
        circulatingSupply: 19339481,
        totalSupply: 21000000,
        maxSupply: 21000000,
        ath: 69045,
        athChangePercentage: -59.68023,
        athDate: "2021-11-10T14:24:11.849Z",
        atl: 67.81,
        atlChangePercentage: 40954.56505,
        atlDate: "2013-07-06T00:00:00.000Z",
        lastUpdated: "2023-04-07T08:04:42.708Z",
        sparklineIn7D: SparklineIn7D(price: [
            28067.573064673663,
            28102.470225017663,
            28067.573064673663,
            28102.470225017663,
            28067.573064673663,
            28102.470225017663,
        ]),
        priceChangePercentage24HInCurrency: -0.12601456331927735, currentHoldings: 1.5
    )
}

extension PreviewProvider {
    static var dev: DeveloperPreview {
        return DeveloperPreview.instance
    }
}
