//
//  ReproducirAudioViewModel.swift
//  Ejercicios-iOS
//
//  Created by Ronaldo on 30/01/23.
//

import Foundation
import AVFoundation

class ReproducirAudioViewModel:ObservableObject{
    var avPlayer: AVPlayer!
    
    var isPlaying: Bool{
        return avPlayer.rate != 0
    }
    
    func loadMusic(urlDeMusica:URL?){
        let avPlayerItem: AVPlayerItem = AVPlayerItem(url: urlDeMusica!)
        avPlayer = AVPlayer(playerItem: avPlayerItem)
    }
    
    func playMusic(){
        avPlayer.play()
    }
    
    func pauseMusic(){
        guard isPlaying else{
            return print("Se intento pasuar la musica mientras no esta reproduciendo")
        }
        avPlayer.pause()
    }
}
