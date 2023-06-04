//
//  SideMenu.swift
//  CryptoMall
//
//  Created by TTGMOTSF on 17/04/2023.
//

import SwiftUI

struct SideMenuView: View {
    
    @Binding var selectedTab: String
    @Namespace var animation
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15, content: {
            
            //Profile Pic
            Image("me")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 70, height: 70)
                .cornerRadius(10)
                .padding(.top, 50)
            VStack(alignment: .leading, spacing: 6, content: {
                Text("Mister All Hands")
                    .font(.custom("Kanit-Bold", size: 26))
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                
                Button(action: {
                    
                    //show profile
                    
                }, label: {
                    Text("View Profile")
                        .font(.custom("Kanit-SemiBold", size: 15))
                        .foregroundColor(.white)
                        .opacity(0.7)
                })
            })
            
            //Tab views...
            VStack(alignment: .leading, spacing: 10) {
                TabButton(image: "bitcoinsign.circle.fill", title: "Market", selectedTab: $selectedTab, animation: animation)
                TabButton(image: "gear", title: "Settings", selectedTab: $selectedTab, animation: animation)
                TabButton(image: "shield.lefthalf.filled", title: "Privacy Policy", selectedTab: $selectedTab, animation: animation)
                TabButton(image: "house", title: "About", selectedTab: $selectedTab, animation: animation)
                TabButton(image: "questionmark.circle", title: "Help", selectedTab: $selectedTab, animation: animation)
            }
            .padding(.leading, -15)
            .padding(.top, 50)
            
            Spacer()
            
            VStack(alignment: .leading, spacing: 6) {
                TabButton(image: "rectangle.righthalf.inset.fill.arrow.right", title: "Log Out", selectedTab: $selectedTab, animation: animation)
                    .padding(.leading, -15)
                Text("Version 1.05")
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .opacity(0.6)
            }
        })
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    }
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView(selectedTab: .constant("Market"))
            .environmentObject(dev.homeVM)
    }
}
