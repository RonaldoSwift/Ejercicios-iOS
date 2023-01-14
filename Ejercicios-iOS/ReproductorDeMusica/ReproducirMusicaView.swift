//
//  ReproducirMusicaView.swift
//  Ejercicios-iOS
//
//  Created by Ronaldo on 12/01/23.
//

import SwiftUI

struct ReproducirMusicaView: View {
    
    let reproducirMusicaViewModel: ReproducirMusicaViewModel = ReproducirMusicaViewModel()
    
    
    var body: some View {
        VStack{
            Button {
                reproducirMusicaViewModel.loadMusic()
            } label: {
                Text("Cargar Musica")
            }

            
            Button {
                reproducirMusicaViewModel.playMusic()
            } label: {
                Text("Play")
            }
            
            
            Button {
                reproducirMusicaViewModel.pauseMusic()
            } label: {
                Text("Pause")
            }
            
        }
        .padding()
    }
}

struct ReproducirMusicaView_Previews: PreviewProvider {
    static var previews: some View {
        ReproducirMusicaView()
    }
}
