//
//  ReproducirMusicaViewModel.swift
//  Ejercicios-iOS
//
//  Created by Ronaldo on 16/01/23.
//

import Foundation
import AVFoundation

class ReproducirMusicaViewModel: ObservableObject{
    
    var avAudioSession: AVAudioSession!
    
    var avPlayer: AVPlayer!
    
    var isPlaying: Bool{
        return avPlayer.rate != 0
    }
    
    func loadMusic(urlDeMusica:String){
        let url = URL(string: urlDeMusica)
        let avPlayerItem: AVPlayerItem = AVPlayerItem(url: url!)
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
    
//    grabar voz
    
    func configurarPermisoParaGrabar(){
        avAudioSession = AVAudioSession.sharedInstance()
        do{
            try avAudioSession.setCategory(.playAndRecord, mode: .default)
            try avAudioSession.setActive(true)
            avAudioSession.requestRecordPermission { [unowned self] permisoActivado in
                DispatchQueue.main.async {
                    if(permisoActivado){
                        print("GRAVANDO...")
                    } else{
                        
                    }
                }
            }
        } catch let error{
        }
    }
}
