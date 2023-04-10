//
//  HomeViewModel.swift
//  CryptoMall
//
//  Created by TTGMOTSF on 07/04/2023.
//

import Foundation
import Combine


class HomeViewModel: ObservableObject {
    
    @Published var statistics: [Statistics] = []
    @Published var allCrypto: [CryptoModel] = []
    @Published var portfolioCrypto: [CryptoModel] = []
    @Published var searchText: String = ""
    
    private let cryptoDataService = CrytpoDataService()
    private let marketDataService = MarketDataService()
    private var cancelables = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
    }
    
    func addSubscribers () {
        
        //Updates allCrypto
        $searchText
            .combineLatest(cryptoDataService.$allCrypto)
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .map(filterCryptos)
            .sink {[weak self] (returnedCrypto) in
                self?.allCrypto = returnedCrypto
            }
            .store(in: &cancelables)
        
        marketDataService.$marketData
        
            .map (mapMarketData)
            .sink {[weak self] (returnedStats) in
                self?.statistics = returnedStats
            }
            .store(in: &cancelables)
    }
    
    
    //MARK - Retreiving market data
    
    private func mapMarketData (marketDataModel: MarketDataModel?) -> [Statistics] {
        var stats: [Statistics] = []
        guard let data = marketDataModel else {
            return stats
        }
        
        let marketCap = Statistics(title: "Market Cap", value: data.marketCup, percantageChange: data.marketCapChangePercentage24HUsd)
        let volume = Statistics(title: "24h Volume", value: data.volume)
        let btcDominance = Statistics(title: "BTC Dominance", value: data.btcDominance)
        let portfolio = Statistics(title: "Portfolio Value", value: "$0.00", percantageChange: 0)
        
        stats.append(contentsOf: [
            volume,
            btcDominance,
            marketCap,
            portfolio
        ])
        return stats
    }
    
    //MARK - Filtering Cryptos
    
    private func filterCryptos (text: String, crypto: [CryptoModel]) -> [CryptoModel] {
        guard !text.isEmpty else {
            return crypto
        }
        let lowercasedText = text.lowercased()
        return crypto.filter { (crypto) -> Bool in
            return crypto.name.lowercased().contains(lowercasedText) ||
            crypto.symbol.lowercased().contains(lowercasedText) ||
            crypto.id.lowercased().contains(lowercasedText)
        }
    }
}
