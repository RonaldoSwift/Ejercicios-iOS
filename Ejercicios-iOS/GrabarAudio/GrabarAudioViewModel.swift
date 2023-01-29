//
//  GrabarAudioViewModel.swift
//  Ejercicios-iOS
//
//  Created by Ronaldo on 27/01/23.
//

import Foundation
import AVFoundation

class GrabarAudioViewModel:NSObject,ObservableObject{
    var avAudioSession: AVAudioSession!
    var audioRecorder: AVAudioRecorder!
    
    @Published var pasarURL: URL? = nil
    
    var rutaDeArchivoDeVoz: URL? = nil
    
    func configurarPermisoParaGrabar(){
        avAudioSession = AVAudioSession.sharedInstance()
        
        do{
            try avAudioSession.setCategory(.playAndRecord,mode: .default)
            try avAudioSession.setActive(true)
            avAudioSession.requestRecordPermission { [unowned self] permisoActivado in
                DispatchQueue.main.async {
                    if(permisoActivado){
                        print("Permiso De Microfono Aceptado")
                    }
                    else{
                        print("Permiso Denegano")
                    }
                }
            }
        } catch let error{
            print("Ocurrio un error al solicitar permiso \(error.localizedDescription)")
        }
    }
    
    
    func empezarAGrabar(){
        //        Configuramos La calidad de grabacion de voz
        let configuraciones: [String: Any] = [
            AVFormatIDKey: Int(kAudioFormatLinearPCM),
            AVSampleRateKey: 44_100,
            AVNumberOfChannelsKey:1,
            AVEncoderAudioQualityKey: AVAudioQuality.max.rawValue
        ]
        
        //        Empezamos a grabar
        rutaDeArchivoDeVoz = getDocumentsDirectory().appendingPathComponent("ronaldoVoz.wav")
        
        do{
            audioRecorder = try AVAudioRecorder(url: rutaDeArchivoDeVoz!, settings: configuraciones)
            audioRecorder.delegate = self
            audioRecorder.record()
            print("GRABANDO....")
        } catch{
            terminarGrabacion(esExitoso: false)
        }
    }
    
    func getDocumentsDirectory() -> URL {
        //Siempre elegir la carpeta documento
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func terminarGrabacion(esExitoso: Bool){
        audioRecorder.stop()
        audioRecorder = nil
        
        if esExitoso {
            print("Se termino la grabacion")
            pasarURL = rutaDeArchivoDeVoz
        }
        else{
            print("Fallo la grabacion")
        }
    }
}

extension GrabarAudioViewModel: AVAudioRecorderDelegate{
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if !flag {
            terminarGrabacion(esExitoso: false)
        }
    }
}


