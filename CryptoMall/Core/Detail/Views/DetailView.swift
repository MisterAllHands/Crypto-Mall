//
//  DetailView.swift
//  CryptoMall
//
//  Created by TTGMOTSF on 13/04/2023.
//

import SwiftUI

struct DetailLoadingView: View {

    @Binding var crypto: CryptoModel?

    var body: some View{
        ZStack {
            if let crypto = crypto{
                DetailView(crypto: crypto)
            }
        }
    }
    
}

struct DetailView: View {
    
    @StateObject private var vm: DetailViewModel
    private let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    private let spacing: CGFloat = 30
    
    init(crypto: CryptoModel) {
        _vm = StateObject(wrappedValue: DetailViewModel(crypto: crypto))
         print("Initialising detail view for \(crypto.name)")
    }
    
    var body: some View {

        ScrollView {

            VStack {
                ChartView(crypto: vm.crypto)
                    .padding(.vertical)
                
                VStack(spacing: 20) {
                    overViewTitle
                    Divider()
                    overViewGrid
                    additionalViewTitle
                    Divider()
                    additionalGrid
                }
                .padding()
            }
        }
        .navigationTitle(vm.crypto.name)
        .toolbar {
            ToolbarItem( placement: .navigationBarTrailing) {
                navigationBarTrailingItems
            }
        }
    }
}


struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DetailView(crypto: dev.crypto)
        }
    }
}

extension DetailView{
    
    private var navigationBarTrailingItems: some View{
        HStack {
            Text(vm.crypto.symbol.uppercased())
                .font(.headline)
            .foregroundColor(Color.theme.secondaryText)
            
            CryptoImageView(crypto: vm.crypto)
                .frame(width: 25, height: 25)
        }
    }
    
    private var overViewTitle: some View{
        Text("Overview")
            .font(.title)
            .bold()
            .foregroundColor(Color.theme.accentColor)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var additionalViewTitle: some View{
        Text("Additional Details")
            .font(.title)
            .bold()
            .foregroundColor(Color.theme.accentColor)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var overViewGrid: some View{
        LazyVGrid(
            columns: columns,
            alignment: .leading,
            spacing: spacing,
            pinnedViews: [],
            content:{
                ForEach(vm.overViewStatistics) { stat in
                    StatisticsView(stat: stat)
                }
            })
    }
    
    private var additionalGrid: some View{
        LazyVGrid(
            columns: columns,
            alignment: .leading,
            spacing: spacing,
            pinnedViews: [],
            content:{
                ForEach(vm.additionalStatistics) { stat in
                    StatisticsView(stat: stat)
                }
            })
    }
}
