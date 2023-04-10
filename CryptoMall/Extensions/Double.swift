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
    
    /// Convert a Double to a String with K, M, Bn, Tr abbreviations.
    /// ```
    /// Convert 12 to 12.00
    /// Convert 1234 to 1.23K
    /// Convert 123456 to 123.45K
    /// Convert 12345678 to 12.34M
    /// Convert 1234567890 to 1.23Bn
    /// Convert 123456789012 to 123.45Bn
    /// Convert 12345678901234 to 12.34Tr
    /// ```
    func formattedWithAbbreviations() -> String {
        let num = abs(Double(self))
        let sign = (self < 0) ? "-" : ""

        switch num {
        case 1_000_000_000_000...:
            let formatted = num / 1_000_000_000_000
            let stringFormatted = formatted.asNumberString()
            return "\(sign)\(stringFormatted)Tr"
        case 1_000_000_000...:
            let formatted = num / 1_000_000_000
            let stringFormatted = formatted.asNumberString()
            return "\(sign)\(stringFormatted)Bn"
        case 1_000_000...:
            let formatted = num / 1_000_000
            let stringFormatted = formatted.asNumberString()
            return "\(sign)\(stringFormatted)M"
        case 1_000...:
            let formatted = num / 1_000
            let stringFormatted = formatted.asNumberString()
            return "\(sign)\(stringFormatted)K"
        case 0...:
            return self.asNumberString()

        default:
            return "\(sign)\(self)"
        }
    }
}
