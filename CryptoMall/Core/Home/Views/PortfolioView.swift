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
                ForEach(vm.allCrypto) { crypto in
                    CryptoLogoView(crypto: crypto)
                        .frame(width: 75)
                        .padding(4)
                        .onTapGesture {
                            withAnimation(.easeIn){
                                selectedCrypto = crypto
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
        
    }
    
}
