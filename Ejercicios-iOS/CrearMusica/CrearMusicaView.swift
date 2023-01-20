//
//  CrearMusicaView.swift
//  Ejercicios-iOS
//
//  Created by Ronaldo on 18/01/23.
//

import SwiftUI

struct CrearMusicaView: View {
    var crearMusicaViewModel: CrearMusicaViewModel = CrearMusicaViewModel()
    private var random = Int.random(in: 1..<200)
    @State private var ingresarTitulo: String = ""
    @State private var ingresarUrl: String = ""
    @State private var mostrarAlerta = false
    @State private var mensajeDeMusicasCreado: String = ""
    
    var body: some View {
        VStack{
            Image("AñadirMusica")
                .resizable()
                .scaledToFit()
            Spacer()
            
            HStack{
                Text("Titulo: ")
                TextField("", text: $ingresarTitulo)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            
            HStack{
                Text("URL: ")
                TextField("", text: $ingresarUrl)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            
            Button {
                Task{
                    do{
                        let musicaCreada = try await crearMusicaViewModel.crearProducto(postMusicasRequest: PostMusicasRequest.init(id: "\(random)", titulo: ingresarTitulo, url: ingresarUrl))
                        mensajeDeMusicasCreado = "La musica creada es: \(musicaCreada.id) \n Titulo: \(musicaCreada.titulo) \nURL: \(musicaCreada.url)"
                        mostrarAlerta = true
                    } catch{
                        mensajeDeMusicasCreado = "Error"
                        mostrarAlerta = true
                    }
                }
            } label: {
                Text("Crear Musica")
            }
            .padding()
            .background(Color.black)
            .cornerRadius(10)
            .alert(mensajeDeMusicasCreado, isPresented: $mostrarAlerta) {
                Button("OK", role: .cancel) { }
            }
            Spacer()
        }
        .padding()
        .background(Color("FondoPrincipal"))
        .navigationTitle("CREANDO PRODUCTO")
    }
}

struct CrearMusicaView_Previews: PreviewProvider {
    static var previews: some View {
        CrearMusicaView()
    }
}
