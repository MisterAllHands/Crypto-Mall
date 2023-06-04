//
//  Background.swift
//  CryptoMall
//
//  Created by TTGMOTSF on 19/04/2023.
//

import Foundation
import SwiftUI

struct Backgroundlayer{
    
    var mainViewGradient: some View{

        
            RadialGradient(
                        gradient: Gradient(stops: [
                    .init(color: Color(#colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1)), location: 0),
                    .init(color: Color(#colorLiteral(red: 0, green: 0.20392157137393951, blue: 1, alpha: 0)), location: 1)]),
                        center: UnitPoint(x: 0.30, y: 0.3999999999999994),
                        startRadius: 120,
                        endRadius: 350
            )
        
    }
    
    var aboutViewgradient: some View {
        LinearGradient(gradient: Gradient(stops: [
            .init(color: Color.theme.gradientColorRed, location: 0),
            .init(color: Color.theme.blueColor, location: 1)]),
                       startPoint: UnitPoint(x: 0.50000000291053439, y: 1.0838161507153998e-8),
                       endPoint: UnitPoint(x: -0.002089660354856915,
                                           y: 0.976613295904758))
    }
    
    var homeViewGradient: some View{
        
        VStack {
            RadialGradient(
                        gradient: Gradient(stops: [
                    .init(color: Color(#colorLiteral(red: 0, green: 0.20555543899536133, blue: 1, alpha: 0.4399999976158142)), location: 0),
                    .init(color: Color(#colorLiteral(red: 0, green: 0.20392157137393951, blue: 1, alpha: 0)), location: 1)]),
                        center: UnitPoint(x: 0.50, y: 0.3999999999999994),
                        startRadius: 110,
                        endRadius: 250
            )
            
            RadialGradient(
                        gradient: Gradient(stops: [
                    .init(color: Color(#colorLiteral(red: 0.7450982332229614, green: 0.10196077823638916, blue: 0.9686274528503418, alpha: 0.47999998927116394)), location: 0),
                    .init(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)), location: 1)]),
                        center: UnitPoint(x: 0.50, y: 0.99999999999999994),
                        startRadius: 15,
                        endRadius: 230
            )
        }
    }
    var textGradient: some View{
        LinearGradient(
                    gradient: Gradient(stops: [
                .init(color: Color(#colorLiteral(red: 0.5842911005020142, green: 0.421996533870697, blue: 0.9291666746139526, alpha: 1)), location: 0),
                .init(color: Color(#colorLiteral(red: 0.6958333253860474, green: 1, blue: 0.781000018119812, alpha: 1)), location: 1)]),
                    startPoint: UnitPoint(x: 1.2851725612869018e-15, y: 0.49999929716798164),
                    endPoint: UnitPoint(x: 1.0604395347399629, y: 0.4999992971679852))
    }
}

