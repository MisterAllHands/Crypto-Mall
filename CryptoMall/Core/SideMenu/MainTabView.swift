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
                .tag("Market")
            SettingsView()
                .tag("Settings")
            PrivacyPolicy()
                .tag("PrivacyPolicy")
            AboutView()
                .tag("About")
            Help()
                .tag("Help")
        }
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(dev.homeVM)
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
