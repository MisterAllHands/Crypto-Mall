//
//  HomeView.swift
//  CryptoMall
//
//  Created by TTGMOTSF on 06/04/2023.
//

import SwiftUI
import Shimmer
import AVKit

struct HomeView: View {
    
    @State var selectedTab = "HomeView"
    @State var showMenu: Bool = false
        
    @EnvironmentObject private var vm: HomeViewModel
    @State private var showPortfolio: Bool = false // <- Animates to the right
    @State private var showPortfolioView: Bool = false // <- shows a new sheet
    @State private var selectCrypto:CryptoModel? = nil
    @State private var showSettingsView: Bool = false
    @State private var shouldStopShimmering: Bool = false
    @State private var showDetailView: Bool = false
    @State private var isRefreshing = false
    @State private var refreshTimer: Timer?
    
    
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
                        .redacted(reason: vm.isLoading ? .placeholder : [])
                        .shimmering(active: vm.isLoading ? true : false)

                    columHeadings

                    if !showPortfolio {
                        allCryptoList
                            .transition(.move(edge: .leading))
                    }

                    if showPortfolio {
                        ZStack(alignment: .top) {
                            if vm.portfolioCrypto.isEmpty && vm.searchText.isEmpty{
                                portfolioEmptyList
                            }else{
                                portfolioList
                            }
                        }
                        .transition(.move(edge: .trailing))
                    }
                    Spacer(minLength: 0)
                }
//                .sheet(isPresented: $showSettingsView) {
//                    SettingsView()
//                }

            }
//            .scaleEffect(showMenu ? 0.84 : 1)
//            .offset(x:showMenu ? getRect().width - 120 : 0)
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
           ContentView()
                .navigationBarHidden(true)
        }
        .environmentObject(dev.homeVM)
    }
}

//MARK: - HomeHeader

extension HomeView {
    private var homeHeader: some View {
        HStack{
            CircleButtonView(buttonName: showPortfolio ? "plus" : "line.3.horizontal")
                .animation(.none)
                .onTapGesture {
                    if showPortfolio {
                        showPortfolioView.toggle()
                    }else{
                        showMenu.toggle()
                        print("ting")
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
                    .listRowBackground(Color.theme.background)
                    .redacted(reason: vm.isLoading ? .placeholder : [])
                    .shimmering(active: vm.isLoading ? true : false)
            }
        }
        .listStyle(.plain)
        .refreshable {
            isRefreshing = true
            Task {
                await MainActor.run {
                    vm.isLoading = true
                }
            }
            SoundManager.instance.playSound(sound: .PullSound)
            await Task.sleep(1_000_000_000) // 1 second delay
            await vm.reloadData()
            refreshTimer?.fire()
            refreshTimer = Timer.scheduledTimer(withTimeInterval: 0, repeats: false, block: { _ in
                SoundManager.instance.playSound(sound: .RefreshSound)
                Task {
                    await MainActor.run {
                        vm.isLoading = false
                    }
                }
            })
        }
        .onChange(of: isRefreshing) { newValue in
            if !newValue{
                refreshTimer?.invalidate()
            }
        }
    }
    
    private var portfolioEmptyList: some View {
        VStack(spacing: 5) {
            Text("You don't have any coins yet. Click + button to get started!")
                .font(.callout)
                .foregroundColor(Color.theme.accentColor)
                .fontWeight(.medium)
                .multilineTextAlignment(.center)
                .padding(50)
            
            Image(systemName: "bitcoinsign.circle.fill")
                .resizable()
                .frame(width: 80, height: 80)
                .foregroundColor(Color.orange)
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
                    .listRowBackground(Color.theme.background)
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
                    vm.isLoading = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2){
                        vm.isLoading = false
                    }
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
