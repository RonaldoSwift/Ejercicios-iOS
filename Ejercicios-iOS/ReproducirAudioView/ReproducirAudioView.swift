//
//  ReproducirAudioView.swift
//  Ejercicios-iOS
//
//  Created by Ronaldo on 30/01/23.
//

import SwiftUI

struct ReproducirAudioView: View {
    
    let reproducirAudioViewModel: ReproducirAudioViewModel = ReproducirAudioViewModel()
    
    @EnvironmentObject var sharedViewModel: SharedViewModel
    var body: some View {
        VStack{
            Image("")
                .resizable()
                .scaledToFit()
            
            Spacer()
            
            Button {
                reproducirAudioViewModel.loadMusic(urlDeMusica: sharedViewModel.url)
            } label: {
                Text("Cargando")
            }
            .padding()
            .frame(width: 300, height: 50)
            .foregroundColor(Color.white)
            .background(Color.black)
            .foregroundColor(Color.white)
            .cornerRadius(10)
            
            Button {
                reproducirAudioViewModel.playMusic()
            } label: {
                Text("Reproducir")
            }
            .padding()
            .frame(width: 300, height: 50)
            .foregroundColor(Color.white)
            .background(Color.black)
            .foregroundColor(Color.white)
            .cornerRadius(10)
            
            Button {
                reproducirAudioViewModel.pauseMusic()
            } label: {
                Text("Pausar")
            }
            .padding()
            .frame(width: 300, height: 50)
            .foregroundColor(Color.white)
            .background(Color.black)
            .foregroundColor(Color.white)
            .cornerRadius(10)
            
            
        }
        .padding()
        .navigationTitle("REPRODUCTOR")
        .background(Color("FondoPrincipal"))
    }
}

struct ReproducirAudioView_Previews: PreviewProvider {
    static var previews: some View {
        ReproducirAudioView()
    }
}
