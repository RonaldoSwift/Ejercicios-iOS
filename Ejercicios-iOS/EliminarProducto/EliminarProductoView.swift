//
//  EliminarProductoView.swift
//  Ejercicios-iOS
//
//  Created by Ronaldo on 13/01/23.
//

import SwiftUI

struct EliminarProductoView: View {
    
    var eliminarProductoViewModel: EliminarProductoViewModel = EliminarProductoViewModel()
    @State private var id: String = ""
    @State private var mensajeDeProductoEliminado : String = ""
    @State private var mostrarAlerta = false
    
    var body: some View {
        VStack{
            Image("Eliminar")
                .resizable()
                .scaledToFit()
            
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
                        let _ = try await eliminarProductoViewModel.eliminarProducto(deletProductosRequest: DeleteProductoRequest.init(id: id))
                        mensajeDeProductoEliminado = "El producto eliminado es ID:\(id)"
                        mostrarAlerta = true
                    } catch {
                        mensajeDeProductoEliminado = "Error"
                        mostrarAlerta = true
                    }
                }
            } label: {
                Text("Eliminar")
            }
            .padding()
            .background(Color.black)
            .cornerRadius(10)
            .alert(mensajeDeProductoEliminado, isPresented: $mostrarAlerta) {
                Button("OK", role: .cancel) { }
            }
            Spacer()
        }
        .padding()
        .background(Color.gray)
        .navigationTitle("ELIMINAR PRODUCTO")
    }
}

struct EliminarProductoView_Previews: PreviewProvider {
    static var previews: some View {
        EliminarProductoView()
    }
}
