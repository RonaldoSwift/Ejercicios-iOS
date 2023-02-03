//
//  ReproducirAudioView.swift
//  Ejercicios-iOS
//
//  Created by Ronaldo on 27/01/23.
//

import SwiftUI

struct ReproducirAudioView: View{
    
    let reproducirAudioViewModel: ReproducirAudioViewModel = ReproducirAudioViewModel()
    
    @EnvironmentObject var sharedViewmodel: SharedViewModel
    
    var body: some View {
        
        VStack{
            Image("ImageReproducir")
                .resizable()
                .scaledToFit()
            
            Spacer()
            
            Button {
                reproducirAudioViewModel.loadMusic(urlDeMusica: URL(string: "https://storage.googleapis.com/ronaldo_bucket/Nino.mp3"))
            } label: {
                Image("Cargando")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40,height: 30)
            }
            .padding()
            .frame(width: 300, height: 50)
            .foregroundColor(Color.black)
            .background(Color("ColorBotones"))
            .foregroundColor(Color.white)
            .cornerRadius(10)
            
            Button {
                reproducirAudioViewModel.playMusic()
            } label: {
                Image("Play")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40,height: 30)
            }
            .padding()
            .frame(width: 300, height: 50)
            .foregroundColor(Color.black)
            .background(Color("ColorBotones"))
            .foregroundColor(Color.white)
            .cornerRadius(10)
            
            Button {
                reproducirAudioViewModel.pauseMusic()
            } label: {
                Image("Pause")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40,height: 30)
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
        .navigationTitle("REPRODUCTOR")
        .background(Color("FondoPrincipal"))
    }
}


struct ReproducirAudioView_Previews: PreviewProvider {
    static var previews: some View {
        ReproducirAudioView()
    }
}
