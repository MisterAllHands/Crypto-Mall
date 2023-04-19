//
//  StatisticsView.swift
//  CryptoMall
//
//  Created by TTGMOTSF on 09/04/2023.
//

import SwiftUI
import Shimmer

struct StatisticsView: View {

    let stat: Statistics

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(stat.title)
                .font(.caption)
                .foregroundColor(Color.theme.secondaryText)

            
                Text(stat.value)
                    .font(.headline)
                    .foregroundColor(Color.theme.accentColor)
            

            HStack {
                Image(systemName: "triangle.fill")
                    .font(.caption)
                    .rotationEffect(
                        Angle(degrees: (stat.percentageChange ?? 0) >= 0 ? 0 : 180 ))
            
                Text(stat.percentageChange?.aspercentString() ?? "")
                    .font(.caption)
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
