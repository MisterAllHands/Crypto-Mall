//
//  String.swift
//  CryptoMall
//
//  Created by TTGMOTSF on 13/04/2023.
//

import Foundation

extension String{
    var removeHTMLOccurances: String {
        return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
    }
}
