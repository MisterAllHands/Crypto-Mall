//
//  CryptoMallApp.swift
//  CryptoMall
//
//  Created by TTGMOTSF on 06/04/2023.
//

import SwiftUI

@main
struct CryptoMallApp: App {
    
    @StateObject private var vm = HomeViewModel()
    @State private var showView: Bool = true
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor : UIColor(Color.theme.accentColor)]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor : UIColor(Color.theme.accentColor)]
        UINavigationBar.appearance().largeTitleTextAttributes = [.font : UIFont(name: "Kanit-Bold", size: 35)!]
        UINavigationBar.appearance().titleTextAttributes = [.font : UIFont(name: "Kanit-Bold", size: 20)!]
        UITableView.appearance().backgroundColor = .clear
    }
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                NavigationView {
                    MainView()
                        .navigationBarHidden(true )
                }
                .environmentObject(vm)
                ZStack {
                    if showView{
                        LaunchView(showVIew: $showView)
                            .transition(.move(edge: .leading))
                    }
                }
                .zIndex(2.0)
            }
            .environment(\.colorScheme, .dark)
        }
    }
}
