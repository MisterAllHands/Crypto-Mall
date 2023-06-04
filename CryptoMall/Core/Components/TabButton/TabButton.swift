//
//  TabButton.swift
//  CryptoMall
//
//  Created by TTGMOTSF on 17/04/2023.
//

import SwiftUI

struct TabButton: View {
    
    var image: String
    var title: String
    
    @Binding var selectedTab: String
    var animation: Namespace.ID
    
    var body: some View {
        Button(action: {
            withAnimation(.spring()){
                selectedTab = title
                
            }
        }, label: {
            HStack(spacing: 15) {
                Image(systemName: image)
                    .font(.title2)
                    .frame(width: 30)
                
                Text(title)
                    .font(.custom("Kanit-SemiBold", size: 17))

            }
            .foregroundColor(selectedTab == title ? Color.theme.blueColor : .white)
            .padding(.vertical, 12)
            .padding(.horizontal, 20)
            .frame(maxWidth: getRect().width - 170, alignment: .leading )
            .background(
                ZStack{
                    if selectedTab == title{
                        Color.white
                            .opacity(selectedTab == title ? 1 : 0)
                            .clipShape(CustomCorners(corners: [.topRight, .bottomRight], radious: 12))
                            .matchedGeometryEffect(id: "TAB", in: animation)
                    }
                }
            )
        })
    }
}

struct TabButton_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView()
            .environmentObject(dev.homeVM)
    }
}
