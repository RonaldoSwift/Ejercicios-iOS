//
//  VerProductosView.swift
//  Ejercicios-iOS
//
//  Created by Ronaldo on 11/01/23.
//

import SwiftUI

struct VerProductosView: View {
    var verProductosViewModel : VerProductosViewModel = VerProductosViewModel()
    @State private var productos : [GetProductosResponse] = []
    
    var body: some View {
        VStack{
            if #available(iOS 16.0, *) {
                if(productos.count > 0){
                    List{
                        ForEach(productos, id: \.id) { (producto: GetProductosResponse) in
                            Text("\(producto.nombre) - \(producto.precio)")
                        }
                    }
                    .scrollContentBackground(.hidden)
                    .navigationTitle("Reporte De Productos")
                }
                else{
                    Spacer()
                    Text("No se encontraron resultados")
                    Spacer()
                }
            }else {
                // Fallback on earlier versions
            }
        }
        .task {
            do{
                let productos = try await
                verProductosViewModel.obtenerTodosLosProductos()
                self.productos = productos
            } catch{
                fatalError("No se encontraron resultados")
            }
        }
        .padding()
        .background(Color.gray)
        .navigationTitle("REGISTRO DE PRODUCTOS")
    }
}

struct VerProductosView_Previews: PreviewProvider {
    static var previews: some View {
        VerProductosView()
    }
}
