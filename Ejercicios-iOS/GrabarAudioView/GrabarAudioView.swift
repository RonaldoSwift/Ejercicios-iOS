//
//  GrabarAudioView.swift
//  Ejercicios-iOS
//
//  Created by Ronaldo on 30/01/23.
//

import SwiftUI

struct GrabarAudioView: View {
    let grabarAuidoViewModel: GrabarAuidioViewModel = GrabarAuidioViewModel()
    
    @EnvironmentObject var sharedViewModel: SharedViewModel
    
    var body: some View {
        VStack{
            Image("")
                .resizable()
                .scaledToFit()
            
            Spacer()
            
            Button {
                grabarAuidoViewModel.configurarPermisoParaGrabar()
            } label: {
                Text("Pedir permiso de microfono")
            }
            .padding()
            .frame(width: 300, height: 50)
            .foregroundColor(Color.white)
            .background(Color.black)
            .foregroundColor(Color.white)
            .cornerRadius(10)
            
            Button {
                grabarAuidoViewModel.empezarAGrabar()
            } label: {
                Text("Empezar a Grabar")
            }
            .padding()
            .frame(width: 300, height: 50)
            .foregroundColor(Color.white)
            .background(Color.black)
            .foregroundColor(Color.white)
            .cornerRadius(10)
            
            Button {
                grabarAuidoViewModel.terminarGrabacion(esExitoso: true)
            } label: {
                Text("Detener Grabacion")
            }
            .padding()
            .frame(width: 300, height: 50)
            .foregroundColor(Color.white)
            .background(Color.black)
            .foregroundColor(Color.white)
            .cornerRadius(10)
            
            Spacer()
            
        }
        .padding()
        .background(Color("FondoPrincipal"))
        .navigationTitle("GRABAR")
        .onReceive(grabarAuidoViewModel.$pasarURL) { pasarURL in
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
