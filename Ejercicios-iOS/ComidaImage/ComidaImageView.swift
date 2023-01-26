//
//  ComidaImageView.swift
//  Ejercicios-iOS
//
//  Created by Ronaldo on 25/01/23.
//

import SwiftUI

struct ComidaImageView: View {
    
    let comidaImageViewModel : ComidaImageViewModel = ComidaImageViewModel()
    @EnvironmentObject var sharedMusicaViewModel: SharedComidaViewModel
    
    var body: some View {
        VStack{
            Button {
                comidaImageViewModel.configurarPermisoParaGrabar()
            } label: {
                Text("Pedir Permiso de Microfono")
            }
            .padding()
            .frame(width: 300, height: 50)
            .foregroundColor(Color.black)
            .background(Color("Botones"))
            .foregroundColor(Color.white)
            .cornerRadius(10)
            
            Button {
                comidaImageViewModel.empezarAGrabar()
            } label: {
                Text("Empezar a grabar")
            }

            Button {
                comidaImageViewModel.terminarGrabacion(esExitoso: true)
            } label: {
                Text("Detener Grabacion")
            }
            
            
        }
    }
}

struct ComidaImageView_Previews: PreviewProvider {
    static var previews: some View {
        ComidaImageView()
    }
}
