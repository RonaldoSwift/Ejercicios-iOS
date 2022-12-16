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
    @State private var datosDeCuenta: String = ""
    @State private var datosDeMovimiento: String = ""
    
    
    
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
                        
                        let cuenta = await buscarCLienteViewModel.obtenerDatosDeLaCuentaPordni(dni: cliente.dni)
                        datosDeCuenta = "\(cuenta)"
                        
                        let movimientos = await buscarCLienteViewModel.obtenerDatosDelMovimientoPorNumeroDeCuenta(numeroDeCuenta: cuenta.numero)
                        datosDeMovimiento = "\(movimientos)"
                    }
                    
                } label: {
                    Image("Lupa")
                        .scaledToFit()
                }
                
            }
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            
            
            List{
                
                if(datosDelCliente != ""){
                    Text(datosDelCliente)
                }
                
                if(datosDeCuenta != ""){
                    Text(datosDeCuenta)
                    
                }
                if(datosDeMovimiento != ""){
                    Text(datosDeMovimiento)
                }
            }
            .navigationTitle("Reporte Cliente")
            
        }
        .padding()
        .background(Color("BlueFondo"))
    }
}

struct BuscarClienteView_Previews: PreviewProvider {
    static var previews: some View {
        BuscarClienteView()
    }
}
