//
//  CrearProductoView.swift
//  Ejercicios-iOS
//
//  Created by Ronaldo on 11/01/23.
//

import SwiftUI

struct CrearProductoView: View {
    var crearProductoViewModel: CrearProductoViewModel = CrearProductoViewModel()
    private var random = Int.random(in: 1..<200)
    @State private var ingresarNombre: String = ""
    @State private var ingresarPrecio: String = ""
    @State private var mostrarAlerta = false
    @State private var mensajeDeProductoCreado: String = ""
    
    var body: some View {
        VStack{
            Image("Producto")
                .resizable()
                .scaledToFit()
            Spacer()
            HStack{
                Text("Nombre: ")
                TextField("", text: $ingresarNombre)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            
            HStack{
                Text("Precio: ")
                TextField("", text: $ingresarPrecio)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            
            Button {
                Task{
                    do{
                        let productoCreado  = try await crearProductoViewModel.crearProducto(postProductosRequest: PostProductosRequest(id: "PR\(random)", nombre: ingresarNombre, precio: Int(ingresarPrecio)!))
                        mensajeDeProductoCreado = "El producto creado es: ID:\(productoCreado.id) \n Nombre: \(productoCreado.nombre) \n Precio: \(productoCreado.precio)"
                        mostrarAlerta = true
                    } catch{
                        mensajeDeProductoCreado = "Error"
                        mostrarAlerta = true
                    }
                }
            } label: {
                Text("Crear producto")
            }
            .padding()
            .background(Color.black)
            .cornerRadius(10)
            .alert(mensajeDeProductoCreado, isPresented: $mostrarAlerta) {
                Button("OK", role: .cancel) { }
            }
            Spacer()
        }
        .padding()
        .background(Color.gray)
        .navigationTitle("CREANDO PRODUCTO")
    }
}

struct CrearProductoView_Previews: PreviewProvider {
    static var previews: some View {
        CrearProductoView()
    }
}
