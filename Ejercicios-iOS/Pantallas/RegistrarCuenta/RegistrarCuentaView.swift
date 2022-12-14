//
//  RegistrarCuentaView.swift
//  Ejercicios-iOS
//
//  Created by Ronaldo Andre Vargas Huaman on 22/11/22.
//

import Foundation
import SwiftUI

struct RegistrarCuentaView: View{
    //@State private var saldoActual: String = ""
    
    @State private var tipoDeCuentaSelection: Int = 1
    @State private var monedaSelection: Int = 1
    @State private var saldo: String = "0"
    
    
    let registrarCuentaViewModel : RegistrarCuentaViewModel = RegistrarCuentaViewModel()
    @EnvironmentObject var sharedViewModel : SharedViewModel

    
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
                Text("Tipo de Cuenta:")
                Spacer()
                Picker(selection: $tipoDeCuentaSelection, label: Text("Seleccion")) {
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
                Picker(selection: $monedaSelection, label: Text("Seleccion")) {
                    Text("Soles").tag(1)
                    Text("Dolares").tag(2)
                }
            }
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            
            
            HStack{
                Text("Coloque el saldo: ")
                TextField("*****", text: $saldo)
                    .keyboardType(.numberPad)
                
            }
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            
            Button {
                Task{
                    await registrarCuentaViewModel.crearCuenta(tipoDeCuentaSelection: tipoDeCuentaSelection, monedaSelection: monedaSelection, saldo: Double(saldo)!, dni: Int(sharedViewModel.dni)!)
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
