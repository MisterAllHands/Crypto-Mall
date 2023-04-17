//
//  LaunchView.swift
//  CryptoMall
//
//  Created by TTGMOTSF on 14/04/2023.
//

import SwiftUI

struct LaunchView: View {
    
    @State private var loadingText: [String] = " Loading Market Data ...".map {String($0)} //<- Creates an array of individual strings from each world.
    
    @State private var showText: Bool = false
    @State private var counter: Int = 0
    @State private var loops: Int = 0
    @Binding var showVIew: Bool
    
    private let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack {
            Color.launchTheme.launchBackground
                .ignoresSafeArea()
            Image("logo-transparent")
                .resizable()
                .frame(width: 100, height: 100)
            ZStack {
                if showText{
                    HStack(spacing: 0) {
                        ForEach(loadingText.indices) { index in
                            Text(loadingText[index])
                                .font(.headline)
                                .fontWeight(.heavy)
                                .foregroundColor(Color.launchTheme.launchAccent)
                                .offset(y: counter == index ? -5 : 0)
                        }
                    }
                    .transition(AnyTransition.scale.animation(.easeIn))
                }
            }
            .offset(y: 70)
        }
        .onAppear{
            showText.toggle()
        }
        .onReceive(timer) { _ in
            withAnimation(.spring()){
                
                let lastIndex = loadingText.count - 1
                if counter == lastIndex{
                    counter = 0
                    loops += 1
                    if loops >= 2{
                        showVIew = false
                    }
                }else {
                    counter += 1
                }
            }
        }
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView(showVIew: .constant(true))
    }
}
