//
//  ReproducirMusicaView.swift
//  Ejercicios-iOS
//
//  Created by Ronaldo on 16/01/23.
//

import SwiftUI

struct ReproducirMusicaView: View {
    
    let reproducirMusicaViewModel: ReproducirMusicaViewModel = ReproducirMusicaViewModel()
    @EnvironmentObject var sharedMusicaViewModel: SharedMusicaViewModel
    
    var body: some View {
        VStack{
            Image("Parlante")
                .resizable()
                .scaledToFit()
            
            Spacer()
            
            ScrollView {
                HStack{
                    Button {
                        reproducirMusicaViewModel.loadMusic(urlDeMusica: sharedMusicaViewModel.getMusicasResponse.url)
                    } label: {
                        Image("CargarMusica")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40,height: 30)
                    }
                    
                    Spacer()
                    
                    Button {
                        reproducirMusicaViewModel.playMusic()
                    } label: {
                        Image("Play")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40,height: 30)
                    }
                    
                    Spacer()
                    
                    Button {
                        reproducirMusicaViewModel.pauseMusic()
                    } label: {
                        Image("Pause")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40,height: 30)
                    }
                }
                .padding()
                .border(Color.black, width: 3.0)
                
                Button {
                    reproducirMusicaViewModel.configurarPermisoParaGrabar()
                } label: {
                    Text("Grabar voz")
                }
                
                
            }
        }
        .padding()
        .navigationTitle("REPRODUCTOR DE MUSICA")
        .background(Color("FondoPrincipal"))
    }
}

struct ReproducirMusicaView_Previews: PreviewProvider {
    static var previews: some View {
        ReproducirMusicaView()
    }
}
