//
//  TabView.swift
//  CryptoMall
//
//  Created by TTGMOTSF on 17/04/2023.
//

import SwiftUI

struct MainTabView: View {
    
    @Binding var selectedTab: String
    
    init(selectedTab: Binding<String>){
        self._selectedTab = selectedTab
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView()
                .tag("HomeView")
            Settings()
                .tag("Settings")
            PrivacyPolicy()
                .tag("PrivacyPolicy")
            About()
                .tag("About")
            Help()
                .tag("Help")
        }
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Market: View{
    
    var body: some View{
        NavigationView {
            Text("Market")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(.primary)
                .navigationTitle("Market")
        }
    }
}

struct Settings: View{
    
    var body: some View{
        NavigationView {
            Text("Settings")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(.primary)
                .navigationTitle("Settings")
        }
    }
}
struct PrivacyPolicy: View{
    
    var body: some View{
        NavigationView {
            Text("Privacy Policy")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(.primary)
                .navigationTitle("Privacy Policy")
        }
    }
}
struct About: View{
    
    var body: some View{
        NavigationView {
            Text("About")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(.primary)
                .navigationTitle("About")
        }
    }
}
struct Help: View{
    
    var body: some View{
        NavigationView {
            Text("Help")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(.primary)
                .navigationTitle("Help")
        }
    }
}
