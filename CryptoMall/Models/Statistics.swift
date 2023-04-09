//
//  Statistics.swift
//  CryptoMall
//
//  Created by TTGMOTSF on 09/04/2023.
//

import Foundation


struct Statistics: Identifiable {
    
    let id = UUID().uuidString
    let title: String
    let value: String
    let percantageChange: Double?
 
    init(title: String, value: String, percantageChange: Double? = nil) {
        self.title = title
        self.value = value
        self.percantageChange = percantageChange
    }
}
 
