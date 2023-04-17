//
//  PortfolioView.swift
//  CryptoMall
//
//  Created by TTGMOTSF on 09/04/2023.
//

import SwiftUI

struct PortfolioView: View {
    
    @EnvironmentObject private var vm: HomeViewModel
    @State private var selectedCrypto: CryptoModel? = nil
    @State private var cryptoAmount: String = ""
    @State private var showSaveButton: Bool = false
    
        
    var body: some View {
        NavigationView {
            ScrollView{
                VStack(alignment: .leading, spacing: 0) {
                    SearchbarView(searchText: $vm.searchText)
                    cryptoLogoStack
                    
                    if selectedCrypto != nil {
                        portfolioInputSection
                    }
                }
            }
            .navigationTitle("Edit Portfolio")
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarLeading) {
                    XmarkButton()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    trailingNavBarButtons
                }
            })
            .background(
                Color.theme.background
            )
            .onChange(of: vm.searchText) { newValue in
                if newValue == "" {
                    removeSelectedCrypto()
                }
            }
        }
    }
}

struct PortfolioView_Previews: PreviewProvider {
    static var previews: some View {
        PortfolioView()
            .environmentObject(dev.homeVM)
    }
}

//MARK: - Extentions

extension PortfolioView {
    
    private var cryptoLogoStack: some View {
        ScrollView(.horizontal, showsIndicators: false,content:  {
            LazyHStack(spacing: 10) {
                ForEach(vm.searchText.isEmpty ? vm.portfolioCrypto : vm.allCrypto) { crypto in
                    CryptoLogoView(crypto: crypto)
                        .frame(width: 75)
                        .padding(4)
                        .onTapGesture {
                            withAnimation(.easeIn){
                                updateSelectedCrypto(crypto: crypto)
                            }
                        }
                        .background(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(selectedCrypto?.id == crypto.id ? Color.theme.green : Color.clear, lineWidth: 1)
                        )
                }
            }
            .frame(height: 125)
            .padding(.leading)
        })
    }
    
    private func updateSelectedCrypto (crypto: CryptoModel) {
        
        selectedCrypto = crypto
        if let portfolioCryptos = vm.portfolioCrypto.first(where: {$0.id == crypto.id}),
           let amount = portfolioCryptos.currentHoldings {
            cryptoAmount = "\(amount)"
        }else{
            cryptoAmount = ""
        }
        
    }
    
    private func getCurrentValue () -> Double {
        if let amount = Double(cryptoAmount) {
            return amount * (selectedCrypto?.currentPrice ?? 0)
        }
        return 0
    }
    
    private var portfolioInputSection: some View {
        VStack(spacing: 20) {
            HStack{
                Text("Current price of \(selectedCrypto?.symbol.uppercased() ?? "") :")
                Spacer()
                Text(selectedCrypto?.currentPrice.asCurrencyWith6Decimals() ?? "")
             }
            Divider()
            HStack {
                Text("Amount in wallet: ")
                Spacer()
                TextField("Ex: 1.20", text: $cryptoAmount)
                    .multilineTextAlignment(.trailing)
                    .keyboardType(.decimalPad)
            }
            Divider()
            HStack {
                Text("Current value: ")
                Spacer()
                Text(getCurrentValue().asCurrencyWith2Decimals())
            }
        }
        .animation(.none)
        .padding()
        .font(.headline)
    }
    
    private var trailingNavBarButtons: some View {
        
        HStack(spacing: 10) {
            Image(systemName: "checkmark")
                .opacity(showSaveButton ? 1.0 : 0.0)
            Button(action: {
                
                saveButtonPressed()
                
            }, label: {
                Text("Save".uppercased())
            })
            .opacity(
                (selectedCrypto != nil && selectedCrypto?.currentHoldings != Double(cryptoAmount)) ? 1.0 : 0.0
            )
        }
        .font(.headline)
        
    }
    
    private func saveButtonPressed () {
        guard
            let crypto = selectedCrypto,
            let amount = Double(cryptoAmount)
        else {return}
        
        //Save to Portfolio
        vm.updatePortfolio(crypto: crypto, amount: amount)
        
        //Show checkmark
        withAnimation(.easeIn) {
            showSaveButton = true
            removeSelectedCrypto()
        }
        
        //Hide keyboard
        UIApplication.shared.endEditing()
        
        //Hide checkmark
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            withAnimation(.easeOut) {
                showSaveButton = false
            }
        }
    }
    
    private func removeSelectedCrypto () {
        selectedCrypto = nil
        vm.searchText = ""
        UIApplication.shared.endEditing()
    }
    
}
