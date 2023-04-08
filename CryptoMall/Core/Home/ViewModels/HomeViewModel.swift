//
//  HomeViewModel.swift
//  CryptoMall
//
//  Created by TTGMOTSF on 07/04/2023.
//

import Foundation
import Combine


class HomeViewModel: ObservableObject {
    
    @Published var allCrypto: [CryptoModel] = []
    @Published var portfolioCrypto: [CryptoModel] = []
    
    private let dataService = CrytpoDataService()
    private var cancelables = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
    }
    
    func addSubscribers () {
        
        dataService.$allCrypto
            .sink {[weak self] returnCrypto in
                self?.allCrypto = returnCrypto
            }
            .store(in: &cancelables)
    }
}
