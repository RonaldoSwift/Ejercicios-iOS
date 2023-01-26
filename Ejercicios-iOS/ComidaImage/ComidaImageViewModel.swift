//
//  ComidaImageViewModel.swift
//  Ejercicios-iOS
//
//  Created by Ronaldo on 25/01/23.
//

import Foundation
import AVFoundation

class ComidaImageViewModel: NSObject, ObservableObject{
    var avAudioSession: AVAudioSession!
    var audioRecorder: AVAudioRecorder!
    
    
    func configurarPermisoParaGrabar(){
        avAudioSession = AVAudioSession.sharedInstance()
        do{
            try avAudioSession.setCategory(.playAndRecord, mode: .default)
            try avAudioSession.setActive(true)
            avAudioSession.requestRecordPermission { [unowned self] permisoActivado in
                DispatchQueue.main.async {
                    if(permisoActivado){
                        print("PERMISO DE MICROFONO ACEPTADO")
                    } else{
                        print("PERMISO DE MICROFONO NO ACEPTADO")
                    }
                }
            }
        } catch let error{
            print("Ocurrio un error al solicitar permiso \(error.localizedDescription)")
        }
    }
    
    func empezarAGrabar(){
        //        Configuramos La calidad de grabacion de vozb
        let configuraciones: [String: Any] = [
            AVFormatIDKey: Int(kAudioFormatLinearPCM),
            AVSampleRateKey: 44_100,
            AVNumberOfChannelsKey:1,
            AVEncoderAudioQualityKey: AVAudioQuality.max.rawValue
        ]
        
        //        Empezamos a grabar
        let rutaDeArchivoDeVoz = getDocumentsDirectory().appendingPathComponent("recording.wav")
        
        do{
            audioRecorder = try AVAudioRecorder(url: rutaDeArchivoDeVoz, settings: configuraciones)
            audioRecorder.delegate = self
            audioRecorder.record()
            print("GRABANDO....")
        } catch{
            terminarGrabacion(esExitoso: false)
        }
        
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .downloadsDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func terminarGrabacion(esExitoso: Bool){
        audioRecorder.stop()
        audioRecorder = nil
        
        if esExitoso {
            print("Se termino la grabacion")
        }
        else{
            print("Fallo la grabacion")
        }
    }
}

extension ComidaImageViewModel: AVAudioRecorderDelegate{
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if !flag {
            terminarGrabacion(esExitoso: false)
        }
    }
}
