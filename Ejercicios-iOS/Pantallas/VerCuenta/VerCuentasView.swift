//
//  VerCuentasView.swift
//  Ejercicios-iOS
//
//  Created by Ronaldo Andre Vargas Huaman on 2/12/22.
//

import Foundation
import SwiftUI

struct VerCuentaView : View {
    let verCuentasViewModel : VerCuentasViewModel = VerCuentasViewModel()
    @State private var cuentaString : [Cuenta] = []
    
    var body: some View{
        if #available(iOS 16.0, *) {
            List{
                ForEach(cuentaString, id: \.id){(cuenta: Cuenta)in
                    Section{
                        Text("Numero De Cuenta: \(cuenta.numero) \nTipo De Cuenta \(cuenta.tipo) \nMoneda: \(cuenta.saldoActual) \nDNI: \(cuenta.dni)")
                            .foregroundColor(Color.black)
                            .background(Color.white)
                    }
                }
            }.task {
                let numeroDeCuentas = await verCuentasViewModel.obtenerTodasLasCuentas()
                cuentaString = numeroDeCuentas
            }
            .background(Color("BlueFondo"))
            .scrollContentBackground(.hidden)
            .navigationTitle("Reporte Cuenta")
        } else {
            // Fallback on earlier versions
        }
    }
}

struct VerCuentaView_Previews: PreviewProvider{
    static var previews: some View{
        VerCuentaView()
    }
}
