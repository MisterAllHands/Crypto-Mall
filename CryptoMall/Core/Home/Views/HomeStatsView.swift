//
//  HomeStatsView.swift
//  CryptoMall
//
//  Created by TTGMOTSF on 09/04/2023.
//

import SwiftUI
import Shimmer


struct HomeStatsView: View {
    
    @EnvironmentObject private var vm: HomeViewModel
    @Binding var showPortfolio: Bool
    
    var body: some View {
        
        HStack {
            ForEach(vm.statistics) { stat in
                StatisticsView(stat: stat)
                    .frame(width: UIScreen.main.bounds.width / 3)
            }
        }
        .frame(width: UIScreen.main.bounds.width, alignment: showPortfolio ? .trailing : .leading)
    }
}

struct HomeStatsView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView{
            HomeStatsView(showPortfolio: .constant(false))
                .environmentObject(dev.homeVM)
        }
    }
}
