//
//  EditarUsuarioView.swift
//  Ejercicios-iOS
//
//  Created by Ronaldo on 22/12/22.
//

import SwiftUI

struct EditarUsuarioView: View {
    
    var usuario: Usuario
    @State private var nombre : String = ""
    @State private var apellido : String = ""
    @State private var dni : String = ""
    @State private var edad : String = ""
    
    var editarUsuarioViewModel : EditarUsuarioViewModel = EditarUsuarioViewModel()
    
    
    var body: some View {
        VStack{
            Image("Person")
                .resizable()
                .scaledToFit()
            
            Spacer()
            
            HStack{
                Text("Nombre: ")
                TextField("", text: $nombre)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            
            HStack{
                Text("Apellido: ")
                TextField("", text: $apellido)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            
            HStack{
                Text("DNI: ")
                TextField("", text: $dni)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            
            HStack{
                Text("Edad: ")
                TextField("", text: $edad)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            
            Spacer()
            
            Button {
                Task{
                    await editarUsuarioViewModel.actualizarUsuario(usuario: usuario)
                }
            } label: {
                Text("ACTUALIZAR".uppercased())
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                    .background(Color.black)
                    .cornerRadius(10)
                    .shadow(radius: 10)
            }
        }
        .task {
            nombre = usuario.nombre
            apellido = usuario.apellido
            dni = String(usuario.dni)
            edad = String(usuario.edad)
        }
        .padding()
        .background(Color("ColorFondoPrincipal"))
        .navigationBarTitle("EDITAR")
    }
}

struct EditarUsuarioView_Previews: PreviewProvider {
    static var previews: some View {
        EditarUsuarioView(usuario: Usuario(nombre: "", apellido: "", dni: 0, edad: 0))
    }
}
