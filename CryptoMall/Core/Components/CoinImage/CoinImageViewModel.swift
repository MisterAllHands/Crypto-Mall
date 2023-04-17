//
//  CoinImageViewModel.swift
//  CryptoMall
//
//  Created by TTGMOTSF on 08/04/2023.
//

import SwiftUI
import Combine

class CryptoImageViewModel: ObservableObject {
    
    @Published var image: UIImage? = nil
    @Published var isLoading: Bool = false
    
    private let crypto: CryptoModel
    private let dataService: CryptoImageService
    private var cancelables = Set<AnyCancellable>()
    
    init(crypto: CryptoModel) {
        self.crypto = crypto
        self.dataService = CryptoImageService(crypto: crypto)
        self.isLoading = true
        getCryptoImage()
    }
    
    private func getCryptoImage () {
        dataService.$image
            .sink { [weak self] (_) in
                self?.isLoading = false
            } receiveValue: {[weak self] (returnedImage) in
                self?.image = returnedImage
            }
            .store(in: &cancelables)
    }
}
