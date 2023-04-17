//
//  DetailViewModel.swift
//  CryptoMall
//
//  Created by TTGMOTSF on 13/04/2023.
//

import Foundation
import Combine

class DetailViewModel: ObservableObject{
    
    @Published var overViewStatistics: [Statistics] = []
    @Published var additionalStatistics: [Statistics] = []
    @Published var crypto: CryptoModel
    @Published var cryptoDescription: String? = nil
    @Published var webURL: String? = nil
    @Published var redditURL: String? = nil

    
    private let cryptoDetailService: CryptoDetailDataService
    private var cancellables = Set<AnyCancellable>()
    
    init(crypto: CryptoModel) {
        self.cryptoDetailService = CryptoDetailDataService(crypto: crypto)
        self.crypto = crypto
        self.addSubscribers()
    }
    
    private func addSubscribers() {
        cryptoDetailService.$cryptoDetails
            .combineLatest($crypto)
            .map(mapDataToStatistics)
            .sink{[weak self](returnedArrays) in
                self?.overViewStatistics = returnedArrays.overview
                self?.additionalStatistics = returnedArrays.additional
            }
            .store(in: &cancellables)
        
        cryptoDetailService.$cryptoDetails
            .sink {[weak self](returnedCryptoDetails) in
                self?.cryptoDescription = returnedCryptoDetails?.readableDescription
                self?.webURL = returnedCryptoDetails?.links?.homepage?.first
                self?.redditURL = returnedCryptoDetails?.links?.subredditURL
            }
            .store(in: &cancellables)
    }
    
    
    //MARK: - Overview & Additional View
    
    private func mapDataToStatistics(cryptoDetailModel: CryptoDetailModel?, cryptoModel: CryptoModel) -> (overview: [Statistics], additional: [Statistics]) {
        let overViewArray = createOverViewArray(cryptoModel: cryptoModel)
        let additionalArray = createAdditionalArray(cryptoModel: cryptoModel, cryptoDetailModel: cryptoDetailModel)
        return(overViewArray, additionalArray)
    }
    
    
    //MARK: - Create OverViewArray
    
   private func createOverViewArray(cryptoModel: CryptoModel) -> [Statistics]{
        let price = cryptoModel.currentPrice.asCurrencyWith6Decimals()
        let pricePercentageChange = cryptoModel.priceChangePercentage24H
        let priceStat = Statistics(title: "Current Price", value: price, percantageChange: pricePercentageChange)
        
        let marketCap =  "$" + (cryptoModel.marketCap?.formattedWithAbbreviations() ?? "")
        let marketCapPercentChange = cryptoModel.marketCapChangePercentage24H
        let marketCapStat = Statistics(title: "Market Capitalization", value: marketCap, percantageChange: marketCapPercentChange)
        
        let rank = "\(cryptoModel.rank)"
        let rankStat = Statistics(title: "Rank", value: rank)
        
        let volume = "$" + (cryptoModel.totalVolume?.formattedWithAbbreviations() ?? "")
        let volumeStat = Statistics(title: "Volume", value: volume)
        
        let overviewArray: [Statistics] = [priceStat, marketCapStat, rankStat, volumeStat]
        
        return overviewArray
    }
    
    
    //MARK: - Create Additional Array
    
   private func createAdditionalArray(cryptoModel: CryptoModel ,cryptoDetailModel: CryptoDetailModel?) -> [Statistics]{
        
        let high = cryptoModel.high24H?.asCurrencyWith6Decimals() ?? "n/a"
        let highStats = Statistics(title: "24 High", value: high)
        
        let low = cryptoModel.low24H?.asCurrencyWith6Decimals() ?? "n/a"
        let lowStat = Statistics(title: "24 Low", value: low)
        
        let priceChange = cryptoModel.priceChangePercentage24H?.asCurrencyWith6Decimals() ?? "n/a"
        
        let pricePercantageChange = cryptoModel.priceChangePercentage24H
        let priceChangeStats = Statistics(title: "24H Price Change", value: priceChange, percantageChange: pricePercantageChange)
        
        let marketCapChange = "$" + (cryptoModel.marketCapChange24H?.formattedWithAbbreviations() ?? "")
        let marketCapPercentageChange = cryptoModel.marketCapChangePercentage24H
        let marketCapChangeStat = Statistics(title: "24H Market Cap Change", value: marketCapChange, percantageChange: marketCapPercentageChange)
        
        let blockTime = cryptoDetailModel?.blockTimeInMinutes ?? 0
        let blockTImeString = blockTime == 0 ? "n/a" : "\(blockTime)"
        let blockStat = Statistics(title: "Block Time", value: blockTImeString)
        
        let hashing = cryptoDetailModel?.hashingAlgorithm ?? "n/a"
        let hashingStat = Statistics(title: "Hashing Algorythm", value: hashing)
        
        let additionalArray: [Statistics] = [
            highStats, lowStat, priceChangeStats, marketCapChangeStat, blockStat, hashingStat
        ]
        
        return additionalArray
    }
}
