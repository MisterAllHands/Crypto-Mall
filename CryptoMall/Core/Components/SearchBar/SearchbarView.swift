//
//  SearchbarView.swift
//  CryptoMall
//
//  Created by TTGMOTSF on 08/04/2023.
//

import SwiftUI

struct SearchbarView: View {
    
    @Binding var searchText: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(searchText.isEmpty ? Color.theme.secondaryText : Color.theme.accentColor)
            TextField("Search by name or symbol...", text: $searchText)
            
                .foregroundColor(Color.theme.accentColor)
                .disableAutocorrection(true)
                .overlay (
                    Image(systemName: "xmark.circle.fill")
                        .padding()
                        .offset(x: 10)
                        .foregroundColor(Color.theme.accentColor)
                        .opacity(searchText.isEmpty ? 0.0 : 1.0)
                        .onTapGesture {
                            UIApplication.shared.endEditing()
                            searchText = ""
                        }
                    ,alignment: .trailing
                )
        }
        .font(.headline)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 30)
                .fill(Color.theme.background)
                .shadow(
                    color: Color.theme.accentColor.opacity(0.25), radius: 10, x: 0, y: 0
                )
        )
        .padding()
    }
}

struct SearchbarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchbarView(searchText: .constant(""))
    }
}
