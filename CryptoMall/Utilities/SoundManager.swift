//
//  SoundManager.swift
//  CryptoMall
//
//  Created by TTGMOTSF on 16/04/2023.
//

import SwiftUI
import AVKit

class SoundManager{
    static let instance = SoundManager()
    var player: AVAudioPlayer?
    
    enum SoundOption: String{
        case PullSound
        case RefreshSound
    }
    
    func playSound(sound: SoundOption){
        guard let url = Bundle.main.url(forResource: sound.rawValue, withExtension: ".mp3") else{return}
        
        do{
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        }catch let error{
            print("Error playing sound \(error)")
        }
    }
}
