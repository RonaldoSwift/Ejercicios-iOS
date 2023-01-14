//
//  ActualizarProductoView.swift
//  Ejercicios-iOS
//
//  Created by Ronaldo on 12/01/23.
//

import SwiftUI

struct ActualizarProductoView: View {
    
    var actualizarProductoViewModel: ActualizarProductoViewModel = ActualizarProductoViewModel()
    @State private var mostrarAlerta = false
    @State private var mensajeDeProductoActualizado : String = ""
    @State private var id: String = ""
    @State private var nombre: String = ""
    @State private var precio: String = ""
    
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
                        let productoActualizado = try await actualizarProductoViewModel.actualizarProducto(putProductosRequest: PutProductosRequest(id: id, nombre: nombre, precio: Int(precio)!))
                        mensajeDeProductoActualizado = "El producto actualizado"
                        mostrarAlerta = true
                    } catch{
                        mensajeDeProductoActualizado = "Error"
                        mostrarAlerta = true
                    }
                }
            } label: {
                Text("Actualizar")
            }
            .padding()
            .background(Color.black)
            .cornerRadius(10)
            .alert(mensajeDeProductoActualizado, isPresented: $mostrarAlerta) {
                Button("OK", role: .cancel) { }
            }
            Spacer()
        }
        .padding()
        .background(Color.gray)
        .navigationTitle("ACTUALIZAR PRODUCTO")
    }
}

struct ActualizarProductoView_Previews: PreviewProvider {
    static var previews: some View {
        ActualizarProductoView()
    }
}
