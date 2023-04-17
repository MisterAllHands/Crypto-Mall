//
//  CryptoDataSeervices.swift
//  CryptoMall
//
//  Created by TTGMOTSF on 07/04/2023.
//

import Foundation
import Combine

class CrytpoDataService {
    
    @Published var allCrypto: [CryptoModel] = []
    var coinSubscription: AnyCancellable?
    
    init () {
        getCrypto()
    }
    
    func getCrypto() {
        
        guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h&locale=en")
        else {
            return
        }
        coinSubscription = NetManager.download(url: url)
            .decode(type: [CryptoModel].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: NetManager.handleCompletion, receiveValue: {[weak self] (returnedCrypto) in
                self?.allCrypto = returnedCrypto
                self?.coinSubscription?.cancel()
            })
    }
}
