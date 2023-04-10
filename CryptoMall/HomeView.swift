//
//  HomeView.swift
//  CryptoMall
//
//  Created by TTGMOTSF on 06/04/2023.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject private var vm: HomeViewModel
    @State private var showPortfolio: Bool = false // <- Animates to the right
    @State private var showPortfolioView: Bool = false // <- shows a new sheet
    
    var body: some View {
        ZStack {
            Color.theme.background
                .ignoresSafeArea()
                .sheet(isPresented: $showPortfolioView) {
                    PortfolioView()
                        .environmentObject(vm)
                }
            VStack {
                homeHeader
                SearchbarView(searchText: $vm.searchText)

                HomeStatsView(showPortfolio: $showPortfolio)
                
                columHeadings
    
                if !showPortfolio {
                     allCryptoList
                        .transition(.move(edge: .leading))
                }
                
                if showPortfolio {
                    portfolioList
                        .transition(.move(edge: .trailing))
                }
                Spacer(minLength: 0)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeView()
                .navigationBarHidden(true)
        }
        .environmentObject(dev.homeVM)
    }
}

//MARK: - HomeHeader

extension HomeView {
    private var homeHeader: some View {
        HStack{
            CircleButtonView(buttonName: showPortfolio ? "plus" : "info")
                .animation(.none)
                .onTapGesture {
                    if showPortfolio {
                        showPortfolioView.toggle()
                    }
                }
                .background(
                    CircleButtonAnimationView(animate: $showPortfolio)
                )
            Spacer()
            Text(showPortfolio ? "Portfolio" : "Market Now")
                .animation(.none)
                .font(.headline)
                .fontWeight(.heavy)
                .foregroundColor(Color.theme.accentColor)
            Spacer()
            CircleButtonView(buttonName: "chevron.right")
                .rotationEffect(Angle(degrees: showPortfolio ? 180 : 0))
                .onTapGesture {
                    withAnimation(.spring()) {
                        showPortfolio.toggle()
                    }
                }
        }
        .padding(.horizontal)
    }
    
    private var allCryptoList: some View {
        List {
            ForEach(vm.allCrypto) { coin in
                CryptoRowView(crypto: coin, showHoldingColumn: false)
                    .listRowInsets(.init(top: 10, leading: 10, bottom: 5, trailing: 10))
            }
        }
        .listStyle(.plain)
    }
        
    private var portfolioList: some View {
        List {
            ForEach(vm.portfolioCrypto) { coin in
                CryptoRowView(crypto: coin, showHoldingColumn: true)
                    .listRowInsets(.init(top: 10, leading: 0, bottom: 5, trailing: 10))
            }
        }
        .listStyle(.plain)
    }
    
    private var columHeadings: some View {
        
        HStack{
            Text("Coin")
                .padding(.leading)
            Spacer()
            if showPortfolio {
                Text("Holdings")
            }
            Text("Price")
                .padding(.trailing)
                .frame(width: UIScreen.main.bounds.width / 3.5, alignment: .trailing)
        }
        .font(.caption)
        .foregroundColor(Color.theme.secondaryText)
        .padding(.horizontal)
    }
}
