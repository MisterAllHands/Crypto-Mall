//
//  MainView.swift
//  CryptoMall
//
//  Created by TTGMOTSF on 17/04/2023.
//

import SwiftUI

struct MainView: View {

    @State var selectedTab = "Market"
    @State private var showMenu = false
    let background = Backgroundlayer()
    

    var body: some View {
        ZStack {
                background.mainViewGradient
                    .ignoresSafeArea()

            SideMenuView(selectedTab: $selectedTab)

            ZStack {

                background.aboutViewgradient
                    .opacity(0.5)
                    .cornerRadius(showMenu ? 15 : 0)
                    .offset(x: showMenu ? -25 : 0)
                    .shadow(color: Color.white.opacity(0.7), radius: 5, x: -5, y: 0)
                    .padding(.vertical, 30)

                background.aboutViewgradient
                    .opacity(0.4)
                    .cornerRadius(showMenu ? 15 : 0)
                    .offset(x: showMenu ? -50 : 0)
                    .shadow(color: Color.white.opacity(0.7), radius: 5, x: -5, y: 0)
                    .padding(.vertical, 60)

                MainTabView(selectedTab: $selectedTab)
            }
            .scaleEffect(showMenu ? 0.84 : 1)
            .offset(x:showMenu ? getRect().width - 120 : 0)
            .overlay(
                Button(action: {
                    withAnimation(.spring()){
                        showMenu.toggle()
                    }
                }, label: {
                    VStack(spacing: 5) {
                        Capsule()
                            .fill(showMenu ? Color.white : Color.clear )
                            .frame(width: 35, height: 4)
                            .rotationEffect(.init(degrees: showMenu ? 35 : 0))
                            .offset(x: showMenu ? -3 : 0, y: showMenu ? -8 : 0)
                        VStack(spacing: 5) {
                            Capsule()
                                .fill(showMenu ? Color.white : Color.clear )
                                .frame(width: 35, height: 4)
                            Capsule()
                                .fill(showMenu ? Color.white : Color.clear )
                                .frame(width: 35, height: 4)
                                .offset(y: showMenu ? -8 : 0)
                        }
                        .rotationEffect(.init(degrees: showMenu ? -40 : 0))
                        .offset(x: showMenu ? 0 : 0, y: showMenu ? 0 : 0)
                    }
                })
                .padding()
                .padding([.leading], 17)
                .padding(.top, 10)
                , alignment: .topLeading
            )
        }
        .onTapGesture {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(dev.homeVM)
    }
}

extension View{
    func getRect() -> CGRect{
        return UIScreen.main.bounds
    }
}
