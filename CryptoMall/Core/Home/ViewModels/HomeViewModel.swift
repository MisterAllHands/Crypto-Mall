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
    @Published var isLoading: Bool = false
    @Published var sortOption: SortOption = .holding
    @Published var searchText: String = ""
    
    private let cryptoDataService = CrytpoDataService()
    private let marketDataService = MarketDataService()
    private let portfolioDataService = PortfolioDataService()
    private var cancelables = Set<AnyCancellable>()
    
    enum SortOption{
        case rank, rankReversed, holding, holdingReversed, price, priceReversed
    }
    
    init() {
        addSubscribers()
    }
    
    func addSubscribers () {
        
        //Updates allCrypto
        $searchText
            .combineLatest(cryptoDataService.$allCrypto, $sortOption)
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .map(filterAndSortCryptos)
            .sink {[weak self] (returnedCrypto) in
                self?.allCrypto = returnedCrypto
            }
            .store(in: &cancelables)
        
        //Updates portfolio cryptos
        $allCrypto
            .combineLatest(portfolioDataService.$savedEntites)
            .map(mapAllCryptosToPortfolio)
            .sink {[weak self] (returnedCryptoes) in
                guard let self = self else{return}
                self.portfolioCrypto = self.sortPortfolioCryptosIfNeeded(crypto: returnedCryptoes)
                
            }
            .store(in: &cancelables)
        
        //Updates market data
        marketDataService.$marketData
            .combineLatest($portfolioCrypto)
            .map(mapMarketData)
            .sink {[weak self] (returnedStats) in
                self?.statistics = returnedStats
                self?.isLoading = false
            }
            .store(in: &cancelables)
       
    }
    
    func updatePortfolio (crypto: CryptoModel, amount: Double) {
        portfolioDataService.updatePortfolio(crypto: crypto, amount: amount)
    }
        
    func reloadData () async {
        self.isLoading = true // update isLoading on the main thread
        DispatchQueue.global(qos: .background).async { [weak self] in
            guard let self = self else{return}
            // perform expensive data loading on a background thread
            cryptoDataService.getCrypto()
            marketDataService.getMarketData()
            DispatchQueue.main.async {
                // update state variable isLoading back on the main thread
                self.isLoading = false
                HapticManager.notification(type: .success)
            }
        }
    }
    
    //MARK - Retreiving market data
    
    private func mapMarketData (marketDataModel: MarketDataModel?, portfolioCryptos: [CryptoModel]) -> [Statistics]{
        var stats: [Statistics] = []
        guard let data = marketDataModel else {
            return stats
        }
        
        let marketCap = Statistics(title: "Market Cap", value: data.marketCup, percantageChange: data.marketCapChangePercentage24HUsd)
        let volume = Statistics(title: "24h Volume", value: data.volume)
        let btcDominance = Statistics(title: "BTC Dominance", value: data.btcDominance)
        
        let portfolioValue =
        portfolioCryptos
            .map({$0.currentHoldingsvalue })
            .reduce(0, +)
        
        let previousValue =
            portfolioCryptos
                .map { (crypto) -> Double in
                    let currentValue = crypto.currentHoldingsvalue
                    let percentChange = crypto.priceChangePercentage24H ?? 0 / 100
                    let previousValue = currentValue / (1 * percentChange)
                    return previousValue
                }
                .reduce(0, +)
        
        let percentageChange = ((portfolioValue - previousValue) / previousValue)
        
        
        let portfolio = Statistics(
            title: "Portfolio Value",
            value: portfolioValue.asCurrencyWith2Decimals(),
            percantageChange: percentageChange)
        
        stats.append(contentsOf: [
            volume,
            btcDominance,
            marketCap,
            portfolio
        ])
        return stats
    }
    
    //MARK: Filter and Sorting Cryptos
    
    private func filterAndSortCryptos(text: String, cryptos: [CryptoModel], sort: SortOption) -> [CryptoModel]{
        var updatedCryptos = filterCryptos(text: text, crypto: cryptos)
        sortCryptos(sort: sort, cryptos: &updatedCryptos)
        return updatedCryptos
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
    
    private func sortCryptos(sort: SortOption, cryptos: inout [CryptoModel]){
        switch sort{
        case .rank, .holding:
            cryptos.sort{(crpto1, crypto2) -> Bool in
                return crpto1.rank < crypto2.rank
            }
        case .rankReversed, .holdingReversed:
            cryptos.sort {(crpto1, crypto2) -> Bool in
                return crpto1.rank > crypto2.rank
            }
        case .price:
            cryptos.sort{(crpto1, crypto2) -> Bool in
                return crpto1.currentPrice > crypto2.currentPrice
            }
        case .priceReversed:
            cryptos.sort{(crpto1, crypto2) -> Bool in
                return crpto1.currentPrice < crypto2.currentPrice
            }
        }
    }
    
    private func sortPortfolioCryptosIfNeeded(crypto: [CryptoModel]) -> [CryptoModel]{
        //Will sort by holdings or holdingsREversed if needed
        switch sortOption{
        case .holding:
            return crypto.sorted(by: {$0.currentHoldingsvalue > $1.currentHoldingsvalue})
        case .holdingReversed:
            return crypto.sorted(by: {$0.currentHoldingsvalue < $1.currentHoldingsvalue})
        default:
            return crypto
        }
    }

    
    private func  mapAllCryptosToPortfolio (cryptoModels: [CryptoModel], portfolioEntities: [Portfolio] ) -> [CryptoModel] {
        cryptoModels
            .compactMap { (currentCrypto) -> CryptoModel? in
                guard let entity = portfolioEntities.first(where: { (entity) -> Bool in
                        return entity.cryptoID == currentCrypto.id}) else{ return nil}
                return currentCrypto.updateHoldings(amount: entity.amount)
        }
    }
}
