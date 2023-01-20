//
//  ActualizarMusicaView.swift
//  Ejercicios-iOS
//
//  Created by Ronaldo on 19/01/23.
//

import SwiftUI

struct ActualizarMusicaView: View {
    
    var actualizarMusicaViewModel: ActualizarMusicaViewModel = ActualizarMusicaViewModel()
    
    @State private var id: String = ""
    @State private var titulo: String = ""
    @State private var url: String = ""
    
    @State private var mostrarAlerta = false
    
    @State private var mensajeDeMusicaActualizada: String = ""
    
    
    
    var body: some View {
        VStack{
            Image("Actualizar")
                .resizable()
                .scaledToFit()
            
            Spacer()
            
            HStack{
                Text("Ingrese id: ")
                TextField("****", text: $id)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            
            HStack{
                Text("Ingrese Titulo: ")
                TextField("****", text: $titulo)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            
            HStack{
                Text("Ingrese URL: ")
                TextField("****", text: $url)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            
            
            Button {
                Task{
                    do{
                        let musicaActualizada = try await actualizarMusicaViewModel.actualizarProducto(putMusicasRequest: PutMusicasRequest.init(id: id, titulo: titulo, url: url))
                        mensajeDeMusicaActualizada = "La musica esta actualizada"
                        mostrarAlerta = true
                    } catch{
                        mensajeDeMusicaActualizada = "Error"
                        mostrarAlerta = true
                    }
                }
            } label: {
                Text("Actualizar")
            }
            .padding()
            .background(Color.black)
            .cornerRadius(10)
            .alert(mensajeDeMusicaActualizada, isPresented: $mostrarAlerta) {
                Button("OK", role: .cancel) { }
            }
            Spacer()
        }
        .padding()
        .navigationTitle("Actualizar Musica")
        .background(Color("FondoPrincipal"))
    }
}

struct ActualizarMusicaView_Previews: PreviewProvider {
    static var previews: some View {
        ActualizarMusicaView()
    }
}
