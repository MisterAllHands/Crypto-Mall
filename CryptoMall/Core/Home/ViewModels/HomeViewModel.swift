//
//  HomeViewModel.swift
//  CryptoMall
//
//  Created by TTGMOTSF on 07/04/2023.
//

import Foundation
import Combine


class HomeViewModel: ObservableObject {
    
    @Published var statistics: [Statistics] = [
        Statistics(title: "Title", value: "Value", percantageChange: 12.20),
        Statistics(title: "Title", value: "Value"),
        Statistics(title: "Title", value: "Value"),
        Statistics(title: "Title", value: "Value", percantageChange: -70.12)
    ]
    
    @Published var allCrypto: [CryptoModel] = []
    @Published var portfolioCrypto: [CryptoModel] = []
    @Published var searchText: String = ""
    
    private let dataService = CrytpoDataService()
    private var cancelables = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
    }
    
    func addSubscribers () {
        
        //Updates allCrypto
        $searchText
            .combineLatest(dataService.$allCrypto)
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .map(filterCryptos)
            .sink {[weak self] (returnedCrypto) in
                self?.allCrypto = returnedCrypto
            }
            .store(in: &cancelables)
    }
    
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
