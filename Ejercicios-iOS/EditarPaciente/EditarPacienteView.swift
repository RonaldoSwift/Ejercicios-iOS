//
//  EditarPacienteView.swift
//  Ejercicios-iOS
//
//  Created by Ronaldo on 5/01/23.
//

import SwiftUI

struct EditarPacienteView: View {
    var paciente : Paciente
    @State private var nombre: String = ""
    @State private var apellido: String = ""
    @State private var caso: String = ""
    @State private var edad: String = ""
    @State private var dni: String = ""
    @State private var alert = false
    
    var editarPacienteViewModel : EditarPacienteViewModel = EditarPacienteViewModel()
    
    var body: some View {
        VStack{
            Image("")
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
                Text("Caso: ")
                TextField("", text: $caso)
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
            
            HStack{
                Text("Dni: ")
                TextField("", text: $dni)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            
            Spacer()
            
            Button {
                Task{
                    await editarPacienteViewModel.actualizarPaciente(
                        id:paciente.id,
                        nombre:nombre,
                        apellido:apellido,
                        caso:caso,
                        edad:Int64(edad)!,
                        dni:Int64(dni)!
                    )
                }
                alert = true
            } label: {
                Text("Actualizar".uppercased())
                    .padding()
                    .shadow(radius: 10)
                    .cornerRadius(10)
                    .foregroundColor(Color.white)
                    .frame (maxWidth: 300)
                    .background(Color.black)
                    .cornerRadius(10)
            }
            .alert("Paciente Actualizado", isPresented: $alert) {
                Button("OK", role: .cancel){}
            }
        }
        .task {
            nombre = paciente.nombre
            apellido = paciente.apellido
            caso = paciente.caso
            edad = String(paciente.edad)
            dni = String(paciente.dni)
        }
        .padding()
        .background(Color("ColorFondoPrincipal"))
        .navigationTitle("EDITAR")
    }
}

struct EditarPacienteView_Previews: PreviewProvider {
    static var previews: some View {
        EditarPacienteView(paciente: Paciente(id: UUID(), nombre: "", apellido: "", caso: "", edad: 0, dni: 0))
    }
}
