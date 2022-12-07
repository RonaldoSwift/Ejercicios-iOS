//
//  RegistrarCuentaView.swift
//  Ejercicios-iOS
//
//  Created by Ronaldo Andre Vargas Huaman on 22/11/22.
//

import Foundation
import SwiftUI

struct RegistrarCuentaView: View{
    @State private var numeroDeCuenta: String = ""
    @State private var tipoDeCuenta: String = ""
    @State private var moneda: String = ""
    //@State private var saldoActual: String = ""
    @State private var DNI: String = ""
    
    @State private var selection: Int = 1
    @State private var selection2: Int = 1
    
    
    let registrarCuentaViewModel : RegistrarCuentaViewModel = RegistrarCuentaViewModel()
    
    var body: some View{
        VStack{
            Text("BBVA")
                .font(.title2)
                .foregroundColor(Color.white)
            Text("REGISTRAR CUENTA")
                .font(.title2)
                .foregroundColor(Color.white)
            Image("Tarjet")
                .resizable()
                .scaledToFit()
                .padding()
            
            Spacer()
            
            HStack{
                Text("Numero de Cuenta:")
                TextField("Ejm 16756400004530", text: $numeroDeCuenta)
                    .keyboardType(.numberPad)
                
            }
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            
            
            HStack{
                Text("Tipo de Cuenta:")
                Spacer()
                Picker(selection: $selection, label: Text("Seleccion")) {
                    Text("Corriente").tag(1)
                    Text("Sueldo").tag(2)
                    Text("Ahorro").tag(3)
                }
            }
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            
            HStack{
                Text("Moneda:")
                Spacer()
                Picker(selection: $selection2, label: Text("Seleccion")) {
                    Text("Soles").tag(1)
                    Text("Dolares").tag(2)
                }
            }
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            
            HStack{
                Text("DNI:")
                TextField("Ejm 7****5", text: $DNI)
                    .keyboardType(.numberPad)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            
            Button {
                Task{
                    await registrarCuentaViewModel.crearCuenta(cuenta: Int(numeroDeCuenta)!, selection: selection, selection2: selection2, tipo: tipoDeCuenta, moneda: moneda, dni: Int(DNI)!)
                }
            } label: {
                Text("REGISTRAR")
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

struct RegistrarCuentaView_Previews: PreviewProvider{
    
    static var previews: some View{
        RegistrarCuentaView()
    }
}
