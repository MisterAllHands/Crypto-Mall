//
//  LottiesView.swift
//  CryptoMall
//
//  Created by TTGMOTSF on 21/04/2023.
//

import SwiftUI
import Lottie

struct LottieView: UIViewRepresentable {
    
    func updateUIView(_ uiView: UIView, context: Context) {
        
    }
    
    
    typealias UIViewType = UIView
    
    var animationView = LottieAnimationView()
        
    func makeUIView(context: Context) -> UIView {
            let view = UIView()
            let animation = LottieAnimationView(
        animationView.animation = animation
            animationView.play()
            
            return view
        }
}
