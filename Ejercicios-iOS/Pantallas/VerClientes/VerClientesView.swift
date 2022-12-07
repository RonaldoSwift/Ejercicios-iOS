//
//  VerClientesView.swift
//  Ejercicios-iOS
//
//  Created by Ronaldo Andre Vargas Huaman on 29/11/22.
//

import Foundation
import SwiftUI

struct VerClientesView : View{
    
    let verClientesViewModel : VerClientesViewModel = VerClientesViewModel()
    @State private var listaString : [Cliente] = []
    
    var body: some View{
        if #available(iOS 16.0, *) {
            List{
                ForEach(listaString, id: \.id){ (cliente: Cliente) in
                    Section{
                        Text("DNI: \(cliente.dni) \nNombre De Cliente: \(cliente.nombre) \nDireccion: \(cliente.distrito)")
                    }
                }
            } .task {
                let nombreDeClientes = await verClientesViewModel.obtenrTodosLosClientes()
                listaString = nombreDeClientes
            }
            .background(Color("BlueFondo"))
            .scrollContentBackground(.hidden)
            .navigationTitle("Reporte Cliente")
        } else {
            // Fallback on earlier versions
        }
    }
}

struct VerClientesView_Previews: PreviewProvider{
    
    static var previews: some View{
        VerClientesView()
    }
}
