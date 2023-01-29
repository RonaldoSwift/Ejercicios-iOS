//
//  GrabarAudioView.swift
//  Ejercicios-iOS
//
//  Created by Ronaldo on 27/01/23.
//

import SwiftUI

struct GrabarAudioView: View {
    let grabarAudioViewModel: GrabarAudioViewModel = GrabarAudioViewModel()
    
    @EnvironmentObject var sharedViewModel: SharedViewModel
    
    var body: some View {
        VStack{
            
            Image("imageGrabar")
                .resizable()
                .scaledToFit()
            
            Spacer()
            
            Button {
                grabarAudioViewModel.configurarPermisoParaGrabar()
            } label: {
                Text("Pedir Permiso de Microfono")
            }
            .padding()
            .frame(width: 300, height: 50)
            .foregroundColor(Color.black)
            .background(Color("ColorBotones"))
            .foregroundColor(Color.white)
            .cornerRadius(10)
            
            Button {
                grabarAudioViewModel.empezarAGrabar()
            } label: {
                Text("Empezar a Grabar")
            }
            .padding()
            .frame(width: 300, height: 50)
            .foregroundColor(Color.black)
            .background(Color("ColorBotones"))
            .foregroundColor(Color.white)
            .cornerRadius(10)
            
            Button {
                grabarAudioViewModel.terminarGrabacion(esExitoso: true)
            } label: {
                Text("Detener Grabacion")
            }
            .padding()
            .frame(width: 300, height: 50)
            .foregroundColor(Color.black)
            .background(Color("ColorBotones"))
            .foregroundColor(Color.white)
            .cornerRadius(10)
            
            Spacer()
        }
        .padding()
        .background(Color("FondoPrincipal"))
        .navigationTitle("GRABAR")
        .onReceive(grabarAudioViewModel.$pasarURL) { pasarURL in
            if pasarURL != nil{
                sharedViewModel.guardarURL(url: pasarURL!)
            }
        }
    }
}

struct GrabarAudioView_Previews: PreviewProvider {
    static var previews: some View {
        GrabarAudioView()
    }
}
