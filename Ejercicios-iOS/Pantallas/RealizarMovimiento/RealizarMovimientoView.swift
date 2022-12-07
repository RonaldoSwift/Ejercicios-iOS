//
//  RealizarMovimientoView.swift
//  Ejercicios-iOS
//
//  Created by Ronaldo on 5/12/22.
//

import Foundation
import SwiftUI

struct RealizarMovimientoView: View{
    @State private var descripcion: String = ""
    @State private var importe: String = ""
    @State private var selection: Int = 1
    
    let realizarMovimientoViewModel : RealizarMovimientoViewModel = RealizarMovimientoViewModel()
    
    var body: some View{
        VStack{
            Text("MOVIMIENTO")
            Image("Movimiento")
                .resizable()
                .scaledToFit()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(20)
            
            Spacer()
            
            HStack{
                Text("Descripcion:")
                TextField("efectivo/cheque/visanet/cajero", text: $descripcion)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            
            HStack{
                Text("Tipo Operacion: ")
                Spacer()
                Picker(selection: $selection, label: Text("Seleccion")) {
                    Text("Deposito").tag(1)
                    Text("Retiro").tag(2)
                }
            }
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            
            HStack{
                Text("Importe: ")
                TextField("0.0", text: $importe)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            
            Button {
                Task{
                    await realizarMovimientoViewModel.crearMovimiento(descripcion: descripcion, selection:selection, importe:Double(importe)!)
                }
            } label: {
                Text("Realizar Movimiento")
                    .padding()
                    .foregroundColor(Color.white)
                    .background(Color("ColorBotones"))
                    .cornerRadius(20)
            }
            
        }
        .padding()
        .background(Color("BlueFondo"))
    }
}

struct RealizarMovimientoView_Previews: PreviewProvider{
    
    static var previews: some View{
        RealizarMovimientoView()
    }
}
