//
//  VerMovimientosView.swift
//  Ejercicios-iOS
//
//  Created by Ronaldo on 6/12/22.
//

import Foundation
import SwiftUI

struct VerMovimientosView : View {
    
    let verMovimientoViewModel : VerMovimientosViewModel = VerMovimientosViewModel()
    @State private var movimientos : [Movimiento] = []
    
    var body: some View{
        
        if #available(iOS 16.0, *) {
            List{
                ForEach(movimientos, id: \.id){ (movimiento: Movimiento) in
                    Section{
                        Text("Numero De Cuenta: \(movimiento.numeroDeCuenta) \nFecha De Operacion: \(movimiento.fechaDeOperacion) \nDescripcion: \(movimiento.descripcion) \nNumero De Operacion: \(movimiento.numeroDeOperacion) \nTipo De Operacion: \(movimiento.importe) \nImporte: \(movimiento.importe) \nSaldoContable \(movimiento.saldoContable)")
                            .foregroundColor(Color.black)
                            .background(Color.white)
                    }
                }
            }
            .task {
                let descripcionDeClientes = await verMovimientoViewModel.obtenerTodosLosMovimientos()
                movimientos = descripcionDeClientes
            }
            .background(Color("BlueFondo"))
            .scrollContentBackground(.hidden)
            .navigationTitle("Reporte Movimiento")
        } else {
            // Fallback on earlier versions
        }
    }
}

struct VerMovimientosView_Previews: PreviewProvider{
    static var previews: some View{
        VerMovimientosView()
    }
}
