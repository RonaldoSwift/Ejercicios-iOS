//
//  ComidaImageViewModel.swift
//  Ejercicios-iOS
//
//  Created by Ronaldo on 25/01/23.
//

import Foundation
import AVFoundation

class ComidaImageViewModel: ObservableObject{
    var avAudioSession: AVAudioSession!
    
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
