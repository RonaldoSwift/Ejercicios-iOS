//
//  EliminarMusicaView.swift
//  Ejercicios-iOS
//
//  Created by Ronaldo on 19/01/23.
//

import SwiftUI

struct EliminarMusicaView: View {
    
    var eliminarMusicasViewModel: EliminarMusicaViewModel = EliminarMusicaViewModel()
    @State private var id: String = ""
    @State private var mostrarAlerta = false
    @State private var mensajeDeMusicasEliminada: String = ""
    
    var body: some View {
        VStack{
            Image("EliminarMusica")
                .resizable()
                .scaledToFit()
            
            Spacer()
            
            HStack{
                Text("Ingrese ID:")
                TextField("", text: $id)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            
            Button {
                Task{
                    do{
                        let _ = try await eliminarMusicasViewModel.eliminarMusica(deletMusicasRequest: DeleteMusicasRequest.init(id: id))
                        mensajeDeMusicasEliminada = "La musica eliminada es: ID:\(id)"
                        mostrarAlerta = true
                    } catch{
                        mensajeDeMusicasEliminada = "Error"
                        mostrarAlerta = true
                    }
                }
            } label: {
                Text("Eliminar")
            }
            .padding()
            .background(Color.black)
            .cornerRadius(10)
            .alert(mensajeDeMusicasEliminada, isPresented: $mostrarAlerta) {
                Button("OK", role: .cancel) { }
            }
            Spacer()
        }
        .padding()
        .navigationTitle("Eliminar")
        .background(Color("FondoPrincipal"))
    }
}

struct EliminarMusicaView_Previews: PreviewProvider {
    static var previews: some View {
        EliminarMusicaView()
    }
}
