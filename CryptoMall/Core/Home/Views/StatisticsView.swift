//
//  StatisticsView.swift
//  CryptoMall
//
//  Created by TTGMOTSF on 09/04/2023.
//

import SwiftUI
import SwiftUI_Shimmer

struct StatisticsView: View {

    let stat: Statistics

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(stat.title)
                .font(.custom("Kanit-ExtraLight", size: 10))
                .foregroundColor(Color.white.opacity(0.7))

            
                Text(stat.value)
                    .font(.custom("Kanit-SemiBold", size: 20))
                    .foregroundColor(Color.white)
            

            HStack {
                Image(systemName: "triangle.fill")
                    .font(.caption)
                    .rotationEffect(
                        Angle(degrees: (stat.percentageChange ?? 0) >= 0 ? 0 : 180 ))
            
                Text(stat.percentageChange?.aspercentString() ?? "")
                    .font(.custom("Kanit-ExtraLight", size: 12))
                    .bold()
            }
            .foregroundColor((stat.percentageChange ?? 0) >= 0 ? Color.theme.green : Color.theme.red)
            .opacity(stat.percentageChange == nil ? 0.0 : 1.0)
        }
    }
}

struct StatisticsView_Previews: PreviewProvider {
    static var previews: some View {
            StatisticsView(stat: dev.state1)
                .previewLayout(.sizeThatFits)
    }
}
