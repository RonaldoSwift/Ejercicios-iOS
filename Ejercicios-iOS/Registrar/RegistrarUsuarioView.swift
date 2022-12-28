//
//  RegistrarUsuarioView.swift
//  Ejercicios-iOS
//
//  Created by Ronaldo on 19/12/22.
//

import SwiftUI

struct RegistrarUsuarioView: View {
    @State private var registrarNombre: String = ""
    @State private var registrarApellido: String = ""
    @State private var registrarDni: String = ""
    @State private var registrarEdad: String = ""
    //Alert
    @State private var alert = false
    
    var registrarUsuarioViewModel: RegistrarUsuarioViewModel = RegistrarUsuarioViewModel()
    @EnvironmentObject var sharedViewModel : SharedViewModel
    
    var body: some View {
        VStack{
            Text("REGISTRO USUARIO")
                .font(.largeTitle)
                .bold()
                .foregroundColor(Color.black)
            Image("Registrar")
                .resizable()
                .scaledToFit()
            
            Spacer()
            
            HStack{
                Text("Nombre: ")
                TextField("*****", text: $registrarNombre)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            
            
            HStack{
                Text("Apellido: ")
                TextField("*****", text: $registrarApellido)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            
            HStack{
                Text("DNI: ")
                TextField("********", text: $registrarDni)
                    .keyboardType(.numberPad)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            
            HStack{
                Text("Edad: ")
                TextField("*****", text: $registrarEdad)
                    .keyboardType(.numberPad)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            
            Button {
                sharedViewModel.guardarNombre(nombre: registrarNombre)
                sharedViewModel.guardarApellido(apellido: registrarApellido)
                sharedViewModel.guardarDni(dni: Int(registrarDni)!)
                sharedViewModel.guardarEdad(edad: Int(registrarEdad)!)
                Task{
                    await registrarUsuarioViewModel.crearCliente(nombre: registrarNombre,apellido: registrarApellido,dni: Int(registrarDni)! ,edad: Int(registrarEdad)!)
                }
                alert = true
            } label: {
                Text("Registrar".uppercased())
                    .fontWeight(.bold)
                    .padding()
                    .background(Color.black)
                    .cornerRadius(10)
                    .shadow(radius: 10)
                
            }
            .alert("Usuario Agregado", isPresented: $alert) {
                Button("OK", role: .cancel) { }
            }
        }
        .padding()
        .background(Color("ColorFondoPrincipal"))
        
    }
}

struct RegistrarUsuarioView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrarUsuarioView()
    }
}
