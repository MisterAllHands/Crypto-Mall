//
//  CryptoDetailService.swift
//  CryptoMall
//
//  Created by TTGMOTSF on 13/04/2023.
//

import Foundation
import Combine


class CryptoDetailDataService {
    
    @Published var cryptoDetails: CryptoDetailModel?
    
    var cryptoDetailSubscription: AnyCancellable?
    let crypto: CryptoModel
    
    init (crypto: CryptoModel) {
        self.crypto = crypto
        getCrypto()
    }
    
    func getCrypto() {
        
        guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/\(crypto.id)?localization=false&tickers=false&market_data=false&community_data=false&developer_data=false&sparkline=false")
        else {
            return
        }
        cryptoDetailSubscription = NetManager.download(url: url)
            .decode(type: CryptoDetailModel.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: NetManager.handleCompletion, receiveValue: {[weak self] (returnedCryptoDetails) in
                self?.cryptoDetails = returnedCryptoDetails
                self?.cryptoDetailSubscription?.cancel()
            })
    }
}
