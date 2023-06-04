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
                .accentColor(.white)
                .foregroundColor(.white)
//                .preferredColorScheme(.dark)
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
                .fill(
                    RadialGradient(
                                gradient: Gradient(stops: [
                            .init(color: Color(#colorLiteral(red: 0, green: 0.20555543899536133, blue: 1, alpha: 0.4399999976158142)), location: 0),
                            .init(color: Color(#colorLiteral(red: 0, green: 0.20392157137393951, blue: 1, alpha: 0)), location: 1)]),
                                center: UnitPoint(x: 0.50, y: -2.0019999999999994),
                                startRadius: 15,
                                endRadius: 170
                    )
                )
                .shadow(
                    color: .white.opacity(0.60), radius: 10, x: 0, y: 0
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
