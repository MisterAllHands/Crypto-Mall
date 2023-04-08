//
//  Double.swift
//  CryptoMall
//
//  Created by TTGMOTSF on 07/04/2023.
//

import Foundation


extension Double {
    
    ///Converts Double to currency with 2 decimal places
    
    private var currencyFormatter2: NumberFormatter {
        let formater = NumberFormatter()
        formater.usesGroupingSeparator = true
        formater.numberStyle = .currency
        formater.minimumFractionDigits = 2
        formater.maximumFractionDigits = 2
        return formater
    }
    
    ///Converts Double to currency as String with 2 decimal places
    
    func asCurrencyWith2Decimals () -> String {
        let number = NSNumber(value: self)
        return currencyFormatter2.string(from: number) ?? "$0.00"
    }
    
    
    ///Converts Double to currency with 6 decimal places
    
    private var currencyFormatter6: NumberFormatter {
        let formater = NumberFormatter()
        formater.usesGroupingSeparator = true
        formater.numberStyle = .currency
        formater.minimumFractionDigits = 2
        formater.maximumFractionDigits = 6
        return formater
    }
    
    ///Converts Double to currency as String with 6 decimal places
    
    func asCurrencyWith6Decimals () -> String {
        let number = NSNumber(value: self)
        return currencyFormatter6.string(from: number) ?? "$0.00"
    }
    
    ///Converts a Double into String representation
 
    func asNumberString () -> String {
        return String(format: "%.2f", self)
    }
    
    ///Converts a Double into String representation
    
    func aspercentString () -> String {
        return asNumberString()  + "%"
    }
}
