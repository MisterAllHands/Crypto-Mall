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
    @State private var selectCrypto:CryptoModel? = nil
    @State private var showDetailView: Bool = false
    
    var body: some View {
            ZStack {
                Color.theme.background
                    .ignoresSafeArea()
                    .sheet(isPresented: $showPortfolioView) {
                        PortfolioView()
                            .environmentObject(vm)
                    }
                VStack(spacing: 15) {
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
            .background(
                NavigationLink(
                    destination: DetailLoadingView(crypto: $selectCrypto),
                    isActive: $showDetailView,
                    label: {EmptyView()})
            )
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
                ForEach(vm.allCrypto) { crypto in
                    CryptoRowView(crypto: crypto, showHoldingColumn: false)
                        .listRowInsets(.init(top: 10, leading: 10, bottom: 5, trailing: 10))
                        .onTapGesture {
                            segue(crypto: crypto)
                        }
                }
            }
            .listStyle(.plain)
            .refreshable {
                vm.reloadData()
            }
    }
        
    private var portfolioList: some View {
        List {
            ForEach(vm.portfolioCrypto) { crypto in
                CryptoRowView(crypto: crypto, showHoldingColumn: true)
                    .listRowInsets(.init(top: 10, leading: 0, bottom: 5, trailing: 10))
                    .onTapGesture {
                        segue(crypto: crypto)
                    }
            }
        }
        .listStyle(.plain)
    }
    
    //Navigating to another destinaton based on clicked crypto
    private func segue(crypto: CryptoModel){
        selectCrypto = crypto
        showDetailView.toggle()
    }
    
    private var columHeadings: some View {
        
        HStack{
            HStack(spacing: 4) {
                Text("Coin")
                    .padding(.leading)
                Image(systemName: "chevron.down")
                    .opacity((vm.sortOption == .rank || vm.sortOption == .rankReversed ? 1.0 : 0.0))
                    .rotationEffect(Angle(degrees: vm.sortOption == .rank ? 0 : 180))
            }
            .onTapGesture {
                withAnimation(.default) {
                    vm.sortOption = vm.sortOption == .rank ? .rankReversed : .rank
                }
            }
            
            Spacer()
            if showPortfolio {
                HStack(spacing: 4) {
                    Text("Holdings")
                        .padding(.trailing)
                    Image(systemName: "chevron.down")
                        .opacity((vm.sortOption == .holding || vm.sortOption == .holdingReversed ? 1.0 : 0.0))
                        .rotationEffect(Angle(degrees: vm.sortOption == .holding ? 0 : 180))
                }
                .onTapGesture {
                    withAnimation(.default) {
                        vm.sortOption = vm.sortOption == .holding ? .holdingReversed : .holding
                    }
                }
            }
            HStack(spacing: 4) {
                Text("Price")
                    .padding(.trailing)
                Image(systemName: "chevron.down")
                    .opacity((vm.sortOption == .price || vm.sortOption == .priceReversed ? 1.0 : 0.0))
                    .rotationEffect(Angle(degrees: vm.sortOption == .price ? 0 : 180))
            }
            .onTapGesture {
                withAnimation(.default) {
                    vm.sortOption = vm.sortOption == .price ? .priceReversed : .price
                }
            }
            .frame(width: UIScreen.main.bounds.width / 3.5, alignment: .trailing)

            Button(action: {
                withAnimation(.linear(duration: 0.8)) {
                    vm.reloadData()
                }
            },label: {
                Image(systemName: "goforward")
            })
            .rotationEffect(Angle(degrees: vm.isLoading ? 360 : 0), anchor: .center)
        }
        .font(.caption)
        .foregroundColor(Color.theme.secondaryText)
        .padding(.horizontal)
    }
}
