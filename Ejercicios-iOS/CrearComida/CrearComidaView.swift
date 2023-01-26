//
//  CrearComidaView.swift
//  Ejercicios-iOS
//
//  Created by Ronaldo on 25/01/23.
//

import SwiftUI

struct CrearComidaView: View {
    var crearComidaViewModel:CrearComidaViewModel = CrearComidaViewModel()
    @State private var random = Int.random(in: 1..<200)
    @State private var nombre: String = ""
    @State private var precio: String = ""
    @State private var mostrarAlerta = false
    @State private var mensajeDeMusicasCreado: String = ""
    
    var body: some View {
        VStack{
            Image("comidaCrear")
                .resizable()
                .scaledToFit()
            Spacer()
            
            HStack{
                Text("NOMBRE: ")
                TextField("", text: $nombre)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            
            HStack{
                Text("PRECIO: ")
                TextField("", text: $precio)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            
            Button {
                Task{
                    do{
                        let comidaCreada = try await crearComidaViewModel.crearComida(postComidasRequest: PostComidasRequest.init(id: "\(random)", nombre: nombre, precio: Int("\(precio)")!))
                        mensajeDeMusicasCreado = "Comida creada: \nID:\(comidaCreada.id) \n Nombre:\(comidaCreada.nombre) \nPrecio:\(comidaCreada.precio)"
                        mostrarAlerta = true
                    } catch{
                        mensajeDeMusicasCreado = "Error"
                        mostrarAlerta = true
                    }
                }
            } label: {
                Text("CREAR COMIDA")
            }
            .padding()
            .frame(width: 300, height: 50)
            .foregroundColor(Color.black)
            .background(Color("Botones"))
            .cornerRadius(10)
            .alert(mensajeDeMusicasCreado, isPresented: $mostrarAlerta) {
                Button("OK", role: .cancel) { }
            }
            Spacer()
        }
        .padding()
        .background(Color("FondoPrincipal"))
        .navigationTitle("CREANDO COMIDA")
    }
}

struct CrearComidaView_Previews: PreviewProvider {
    static var previews: some View {
        CrearComidaView()
    }
}
