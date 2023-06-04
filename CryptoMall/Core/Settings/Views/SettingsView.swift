//
//  SettingsView.swift
//  CryptoMall
//
//  Created by TTGMOTSF on 13/04/2023.
//

import SwiftUI

struct SettingsView: View{
    
    var body: some View{
        NavigationView {
            Form {
                Section(header: "Profile") {
                    Button(action: {
                        //navigate to profile
                    }, label: {
                        SettingsColums(img:  "person.fill" , title: " Your profile", color: .purple)
                    })
                }
                Section(header: "Feautures & Share") {
                    Button(action: {
                        //navigate to the feautures screen
                    }, label: {
                        SettingsColums(img:  "sparkles" , title: "Feautures", color: .purple)
                    })
                    Button(action: {
                        //navigate to the sharing screen
                    }, label: {
                        SettingsColums(img:  "gift" , title: "Tell your friends", color: .purple)
                    })
                    Button(action: {
                        //navigate to the github
                    }, label: {
                        SettingsColums(img:  "star" , title: "Rate us", color: .purple)
                    })
                }
                Section(header: "Share your ideas") {
                    Button(action: {
                        //navigate to the suggestion screen
                    }, label: {
                        SettingsColums(img:  "star.circle" , title: "Suggest to feauture", color: .purple)
                    })
                    Button(action: {
                        //navigate to the report screen
                    }, label: {
                        SettingsColums(img:  "exclamationmark.triangle" , title: "Report a bug", color: .purple)
                    })
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    menuButton
                }
            }
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    private var menuButton: some View{
        VStack{
            Button(action: {
                withAnimation(.spring()){
                }
            }, label: {
                VStack(spacing: 6) {
                    Capsule()
                        .fill(.white)
                        .frame(width: 30, height: 3)
                    VStack(spacing: 6) {
                        Capsule()
                            .fill(.white)
                            .frame(width: 30, height: 3)
                        Capsule()
                            .fill(.white)
                            .frame(width: 30, height: 3)
                    }
                }
            })
            .padding()
            .padding([.leading], 7)
            .padding(.top, -5)
        }
    }
}

struct SettingsView_Previews: PreviewProvider{
    static var previews: some View{
        SettingsView()
    }
}

