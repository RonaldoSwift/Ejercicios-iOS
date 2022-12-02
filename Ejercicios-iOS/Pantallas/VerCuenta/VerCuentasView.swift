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
    @State private var cuentaString : [String] = []
    
    var body: some View{
        ScrollView{
            List{
                ForEach(cuentaString, id: \.self){(stringe: String)in
                    Text(stringe)
                }
            }
        }.task {
            let numeroDeCuentas = await verCuentasViewModel.obtenerTodasLasCuentas()
            cuentaString = numeroDeCuentas
        }
    }
}

struct VerCuentaView_Previews: PreviewProvider{
    static var previews: some View{
        VerCuentaView()
    }
}
