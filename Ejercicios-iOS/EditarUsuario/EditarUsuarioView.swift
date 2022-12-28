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
    @State private var alert = false
    
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
                    await editarUsuarioViewModel.actualizarUsuario(
                        id: usuario.id,
                        nombre: nombre,
                        apellido:apellido,
                        dni: Int64(dni)!,
                        edad: Int64(edad)!
                    )
                }
                alert = true
            } label: {
                Text("ACTUALIZAR".uppercased())
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                    .background(Color.black)
                    .cornerRadius(10)
                    .shadow(radius: 10)
            }
            .alert("Usuario Actualizado", isPresented: $alert) {
                Button("OK", role: .cancel){}
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
        EditarUsuarioView(usuario: Usuario(id: UUID(), nombre: "", apellido: "", dni: 0, edad: 0))
    }
}
