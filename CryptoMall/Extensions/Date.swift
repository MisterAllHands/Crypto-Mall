//
//  Day.swift
//  CryptoMall
//
//  Created by TTGMOTSF on 13/04/2023.
//

import Foundation

extension Date{
    
    init(coinGeckoString: String) {
        let formater = DateFormatter()
        formater.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let date = formater.date(from: coinGeckoString) ?? Date()
        self.init(timeInterval: 0, since: date)
    }
    
    private var shortFormater: DateFormatter {
        let formater = DateFormatter()
        formater.dateStyle = .short
        return formater
    }
    
    func asShortDateString() -> String{
        return shortFormater.string(from: self)
    }
}
