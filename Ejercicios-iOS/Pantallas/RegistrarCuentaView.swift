//
//  RegistrarCuentaView.swift
//  Ejercicios-iOS
//
//  Created by Ronaldo Andre Vargas Huaman on 22/11/22.
//

import Foundation
import SwiftUI

struct RegistrarCuentaView: View{
    @State private var numeroDeCuenta = ""
    @State private var tipoDeCuenta = ""
    @State private var moneda = ""
    @State private var saldoActual = ""
    @State private var DNI = ""
    
    var body: some View{
        VStack{
            Text("BBVA")
                .font(.title2)
                .foregroundColor(Color.white)
            Text("REGISTRAR CUENTA")
                .font(.title2)
                .foregroundColor(Color.white)
            Image(systemName: "person.text.rectangle.fill")
                .resizable()
                .foregroundColor(Color.white)
                .padding()
            
            Spacer()
            
            HStack{
                Text("Numero de Cuenta:")
                TextField("Ejm 16756400004530", text: $numeroDeCuenta)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            
            
            HStack{
                Text("Tipo de Cuenta:")
                TextField("Corriente/Bancaria", text: $tipoDeCuenta)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            
            HStack{
                Text("Moneda:")
                TextField("Soles/Dolares", text: $moneda)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            
            HStack{
                Text("Saldo Actual:")
                TextField("********", text: $saldoActual)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            
            HStack{
                Text("DNI:")
                TextField("Ejm 7****5", text: $DNI)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            
        }
        .padding()
        .background(Color("BlueFondo"))
    }
}


struct RegistrarCuentaView_Previews: PreviewProvider{
    
    static var previews: some View{
        RegistrarCuentaView()
    }
}
