//
//  ReproducirMusicaViewModel.swift
//  Ejercicios-iOS
//
//  Created by Ronaldo on 12/01/23.
//

import Foundation
import AVFoundation

class ReproducirMusicaViewModel: ObservableObject{
    
    var avPlayer: AVPlayer!
    
    var isPlaying: Bool{
        return avPlayer.rate != 0
    }
    
    func loadMusic(){
        let url = URL(string: "https://s3.amazonaws.com/kargopolov/kukushka.mp3")
        let avPlayerItem: AVPlayerItem = AVPlayerItem(url: url!)
        avPlayer = AVPlayer(playerItem: avPlayerItem)
        
    }
    
    func playMusic(){
        avPlayer.play()
    }
    
    func pauseMusic(){
        guard isPlaying else{
            return print("Se intento pausar la muscia mientras no esta reproduciendo")
        }
        avPlayer.pause()
    }
    
}
