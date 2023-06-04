//
//  SettingsColums.swift
//  CryptoMall
//
//  Created by TTGMOTSF on 04/06/2023.
//

import SwiftUI

struct SettingsColums: View {
    
    var img: String
    var title: String
    var color: Color
    
    var body: some View {
        HStack {
            Image(systemName: img )
                .font(.headline)
                .foregroundColor(color)
            Text(title)
                .font(.headline)
                .padding(.leading, 10)
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .font(.headline)
                .foregroundColor(.gray)
        }
    }
}

struct SettingsColums_Previews: PreviewProvider {
    static var previews: some View {
        SettingsColums(img: "sparks", title: "Feautures", color: .purple)
    }
}
