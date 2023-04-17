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
    @Published var isGettingMarketData: Bool = true
    var marketDataSubscription: AnyCancellable?
    
    init () {
        getMarketData()
    }
    
    func getMarketData(){
        guard let url = URL(string: "https://api.coingecko.com/api/v3/global")
        else {
            return
        }
        marketDataSubscription = NetManager.download(url: url)
            .decode(type: MData.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: NetManager.handleCompletion, receiveValue: {[weak self] (returnedMarketData) in
                self?.marketData = returnedMarketData.data
                self?.marketDataSubscription?.cancel()
            })
    }
}
