//
//  MarketDataService.swift
//  CryptoMall
//
//  Created by TTGMOTSF on 09/04/2023.
//


import Foundation
import Combine

class MarketDataService {
    
    @Published var marketData: MarketDataModel? = nil
    var marketDataSubscription: AnyCancellable?
    
    init () {
        getMarketData()
    }
    
    private func getMarketData() {
        
        guard let url = URL(string: " URL: https://api.coingecko.com/api/v3/global")
        else {
            return
        }
        marketDataSubscription = NetManager.download(url: url)
            .decode(type: MData.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetManager.handleCompletion, receiveValue: {[weak self] (returnedMarketData) in
                self?.marketData = returnedMarketData.data
                self?.marketDataSubscription?.cancel()
            })
    }
}