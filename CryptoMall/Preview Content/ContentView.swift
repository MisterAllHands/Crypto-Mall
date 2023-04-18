//
//  ContentView.swift
//  CryptoMall
//
//  Created by TTGMOTSF on 06/04/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        MainView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(dev.homeVM)
    }
}
