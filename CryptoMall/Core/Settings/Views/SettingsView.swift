//
//  SettingsView.swift
//  CryptoMall
//
//  Created by TTGMOTSF on 13/04/2023.
//

import SwiftUI

struct SettingsView: View {
    
    let defaultURL = URL(string: "https://google.com")!
    let twitterURL = URL(string: "https://twitte.com/misterallhands")!
    let githubURL = URL(string: "https://github.com/misterallhands")!
    let instagramURL = URL(string: "https://instagram.com/prins_alif")!
    let portfolioURL = URL(string: "https://github.com/misterallhands")!
    
    
    var body: some View {
        NavigationView {
            ZStack{
                //background
                Color.theme.background
                    .ignoresSafeArea()
                
                //content
                List {
                    settingDetails
                    coinGeckoSection
                    developerSection
                    appSettings
                }
                .listRowBackground(Color.theme.background.opacity(0.5))
            }
            .font(.headline)
            .listStyle(GroupedListStyle())
            .navigationTitle("Settings")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    XmarkButton()
                }
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}


//MARK: - Extension

extension SettingsView {
            
    private var settingDetails: some View {
        Section(header: Text("Crypto - Mall")){
            VStack(alignment: .leading, spacing: 20) {
                Image("logo")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                Text("Crypto Mall ! ")
                    .font(.title2)
                    .fontWeight(.semibold)
                + Text("The app fethces crypto data from internet and presents it in nice and consise way to user. The App comes with pretty decent feauteres allowing users to search for coins, add them to their portfolio, filter them based on their own prefernce and many more. The app uses MVVM Architecture, Combine and Core Data.")
                    .font(.callout)
                    .fontWeight(.light)
                    .foregroundColor(Color.theme.accentColor)
            }
            .padding(.vertical)
        }
    }
        
        private var coinGeckoSection: some View{
            Section(header: Text("CoinGecko")) {
                VStack(alignment: .leading, spacing: 20){
                    Image("coingecko")
                        .resizable()
                        .frame(height: 100)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                    Text("CoinGecko")
                        .font(.title3)
                        .fontWeight(.semibold)
                   + Text(" was used to get Crypto Currency Data from a generated API. It's completely free to use and  comes with paid servises as well. ")
                        .font(.callout)
                        .fontWeight(.light)
                        .foregroundColor(Color.theme.accentColor)
                }
            }
        }
    
    private var developerSection: some View {
        Section(header: Text("Developer")){
            VStack(alignment: .leading) {
                    Image("me3")
                        .resizable()
                        .frame(width: 200, height: 260)
                        .cornerRadius(150)
                    
                    Text("This App was built by Ramazon Odinaev through tons of research and expertice. It's build 100% purely in SwiftUI and utilizes the core aspects of SwiftUI technology. I implemented multi-threading, publishers/subscribers,and data persistance.")
                        .fontWeight(.light)
                
                Link(destination: twitterURL){
                    HStack {
                        Image("twitter")
                        Text("Follow me on")
                        + Text(" Twitter")
                            .foregroundColor(.blue)
                            .fontWeight(.semibold)
                    }
                }
                
                Link(destination: instagramURL){
                    HStack(spacing: 10) {
                        Image("instagram2")
                        Text("Follow me on")
                        + Text(" Instagram")
                            .foregroundColor(.pink)
                            .fontWeight(.semibold)
                    }
                }
                
                Link(destination: githubURL){
                    HStack(spacing: 10) {
                        Image("github")
                        Text("")
                        + Text("GitHub")
                            .fontWeight(.bold)
                    }
                }
                
                Link(destination: portfolioURL){
                    HStack(spacing: 10) {
                        Image("website")
                        Text("My")
                        + Text(" Website")
                            .foregroundColor(.blue)
                            .fontWeight(.semibold)
                    }
                }
            }
            .font(.callout)
        }
    }
    
    private var appSettings: some View{
        Section(header: Text("Privacy & Security")) {
            VStack(alignment: .leading, spacing: 20){
                Link("Terms of Service", destination: defaultURL)
                Link("Company Website", destination: defaultURL)
                Link("Privacy Policy", destination: defaultURL)
                Link("Learn More", destination: defaultURL)
            }
            .accentColor(.blue)
        }
    }
}
