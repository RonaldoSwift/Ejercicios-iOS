//
//  ActualizarComidaView.swift
//  Ejercicios-iOS
//
//  Created by Ronaldo on 25/01/23.
//

import SwiftUI

struct ActualizarComidaView: View {
    var actualizarComidaViewModel : ActualizarComidaViewModel = ActualizarComidaViewModel()
    @State private var id: String = ""
    @State private var nombre: String = ""
    @State private var precio: String = ""
    @State private var mostrarAlerta = false
    @State private var mensajeDeComidaActualizada: String = ""
    
    var body: some View {
        VStack{
            Image("ActualizarComida")
                .resizable()
                .scaledToFit()
            
            HStack{
                Text("Ingrese id: ")
                TextField("****", text: $id)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            
            HStack{
                Text("Ingrese Nombre: ")
                TextField("****", text: $nombre)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            
            HStack{
                Text("Ingrese Precio: ")
                TextField("****", text: $precio)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            
            Button {
                Task{
                    do{
                        let comidaActualizada = try await actualizarComidaViewModel.actualizarComida(putComidasRequest: PutComidasRequest.init(id: id, nombre: nombre, precio: Int("\(precio)")!))
                        mensajeDeComidaActualizada = "Comida actualizada"
                        mostrarAlerta = true
                    } catch{
                        mensajeDeComidaActualizada = "Error no se pudo actualizar"
                        mostrarAlerta = true
                    }
                }
            } label: {
                Text("Actualizar")
            }
            .padding()
            .frame(width: 300, height: 50)
            .foregroundColor(Color.black)
            .background(Color("Botones"))
            .cornerRadius(10)
            .alert(mensajeDeComidaActualizada, isPresented: $mostrarAlerta) {
                Button("OK", role: .cancel) { }
            }
            Spacer()
        }
        .padding()
        .background(Color("FondoPrincipal"))
        .navigationTitle("ACTUALIZAR")
    }
}

struct ActualizarComidaView_Previews: PreviewProvider {
    static var previews: some View {
        ActualizarComidaView()
    }
}
