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
    //    Alert
    @State private var showingAlert = false
    
    let registrarClienteViewModel : RegistrarClienteViewModel = RegistrarClienteViewModel()
    @EnvironmentObject var sharedViewModel : SharedViewModel
    
    
    var body: some View{
        
        let valueProxy = Binding<String>(
            get: { ingresoDNI },
            set: { ingresoDNI = String($0.prefix(8)) }
        )
        
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
            
            Image("Person")
                .resizable()
                .scaledToFit()
                .padding()
            
            Spacer()
            HStack{
                Text("Ingrese DNI:")
                TextField("DNI", text: valueProxy )
                    .textFieldStyle(RoundedBorderTextFieldStyle())
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
                sharedViewModel.guardarDni(dni: Int(ingresoDNI)!)
                Task{
                    await registrarClienteViewModel.crearCliente(dni: Int(ingresoDNI)!, nombreCliente: ingreseNombre, direccion: ingreseDireccion, distrito: ingreseDistrito)
                }
                showingAlert = true
            }
            .alert("Cliente Ingresado", isPresented: $showingAlert) {
                Button("OK", role: .cancel) { }
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
