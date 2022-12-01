//
//  RegistrarClienteView.swift
//  Ejercicios-iOS
//
//  Created by Ronaldo Andre Vargas Huaman on 21/11/22.
//

import Foundation
import SwiftUI

struct RegistrarClienteView: View{
    
    @State private var ingresoDNI: String = ""
    @State private var ingreseNombre: String = ""
    @State private var ingreseDireccion: String = ""
    @State private var ingreseDistrito: String = ""
    let registrarClienteViewModel : RegistrarClienteViewModel = RegistrarClienteViewModel()
    
    var body: some View{
        VStack{
            Text("BBVA")
                .font(.title)
                .foregroundColor(Color.white)
            Text("REGISTRO DE CLIENTE")
                .padding()
                .font(.title2)
                .foregroundColor(Color.white)
                .background(Color("ColorBotones"))
                .cornerRadius(10)
            
            Image(systemName: "person.fill.badge.plus")
                .resizable()
                .padding()
                .foregroundColor(Color.white)
            
            Spacer()
            HStack{
                Text("Ingrese DNI:")
                TextField("DNI", text: $ingresoDNI )
                    .keyboardType(.numberPad)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            
            HStack{
                Text("Ingrese Nombre: ")
                TextField("Nombre", text: $ingreseNombre)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            
            HStack{
                Text("Ingrese Direccion:")
                TextField("Direccion", text: $ingreseDireccion)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            
            HStack{
                Text("Ingrese Distrito:")
                TextField("Distrito", text: $ingreseDistrito)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            
            Button("REGISTRAR"){
                Task{
                    await registrarClienteViewModel.crearCliente(dni: Int(ingresoDNI)!, nombreCliente: ingreseNombre, direccion: ingreseDireccion, distrito: ingreseDistrito)
                }
            }
            .padding()
            .foregroundColor(Color.white)
            .background(Color("ColorBotones"))
            .cornerRadius(20)
            
        }
        .padding()
        .background(Color("BlueFondo"))
    }
}


struct RegistrarClienteView_Previews: PreviewProvider{
    
    static var previews: some View{
        RegistrarClienteView()
    }
}