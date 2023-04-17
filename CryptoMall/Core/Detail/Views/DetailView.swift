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
    @State private var showDescription: Bool = false
    
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
                VStack(spacing: 15) {
                    overViewTitle
                    Divider()
                    cryptoDescription
                    overViewGrid
                    additionalViewTitle
                    Divider()
                    additionalGrid
                    websiteSection
                }
                .padding()
            }
        }
        .background(
            Color.theme.background
                .ignoresSafeArea()
        )
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


//MARK: - Extension


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
    
    private var websiteSection: some View {
        HStack{
            if let website = vm.webURL,
               let url = URL(string: website){
                Link("Visit Website", destination: url)
                    .accentColor(.blue.opacity(0.9))
            }
            
            Spacer()
            
            if let reddit = vm.redditURL,
               let url = URL(string: reddit){
                Link("Visit Reddit", destination: url)
                    .accentColor(Color.secondary)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .font(.system(size: 18, weight: .bold, design: .rounded))
    }
    
    private var cryptoDescription: some View{
        ZStack {
            if let cryptoDescription = vm.cryptoDescription, !cryptoDescription.isEmpty{
                VStack(alignment: .leading, spacing: 1) {
                    Text(cryptoDescription)
                        .lineLimit(showDescription ? nil : 4)
                        .font(.callout)
                        .foregroundColor(Color.theme.secondaryText)
                    
                        Button(action: {
                            withAnimation(.easeInOut){
                                showDescription.toggle()
                            }
                        },label: {
                            HStack(spacing: 5) {
                                Text(showDescription ? "Less" : "Read more")
                                    .font(.caption)
                                    .fontWeight(.medium)
                                    .padding(.vertical, 3)
                                Image(systemName: showDescription ? "chevron.up" : "chevron.down")
                                    .font(.caption)
                                    .tint(Color.theme.red)
                            }
                        })
                        .accentColor(Color.theme.red)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
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
