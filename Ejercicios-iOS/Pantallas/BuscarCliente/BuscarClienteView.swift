//
//  BuscarClienteView.swift
//  Ejercicios-iOS
//
//  Created by Ronaldo on 14/12/22.
//

import SwiftUI

struct BuscarClienteView: View {
    @State private var buscarDni: String = ""
    @State private var datosDelCliente: String = ""
    
    var buscarCLienteViewModel : BuscarClienteViewModel = BuscarClienteViewModel()
    
    
    var body: some View {
        VStack{
            HStack{
                TextField("DNI", text: $buscarDni)
                Button {
                    Task{
                        let cliente =
                        await  buscarCLienteViewModel.obtenerDatosDelClientePorDNI(dni:Int(buscarDni)!)
                        datosDelCliente = "\(cliente)"
                    }
                } label: {
                    Image("Lupa")
                        .scaledToFit()
                }
            }
            .padding()
            
            ScrollView{
                Text(datosDelCliente)
            }
        }
        .padding()
    }
}

struct BuscarClienteView_Previews: PreviewProvider {
    static var previews: some View {
        BuscarClienteView()
    }
}
