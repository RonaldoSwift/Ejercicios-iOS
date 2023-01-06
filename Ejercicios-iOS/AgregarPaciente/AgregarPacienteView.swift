//
//  AgregarPacienteView.swift
//  Ejercicios-iOS
//
//  Created by Ronaldo on 29/12/22.
//

import SwiftUI

struct AgregarPacienteView: View {
    
    @State private var ingreseNombre : String = ""
    @State private var ingreseApellido : String = ""
    @State private var ingreseCaso : String = ""
    @State private var ingreseEdad : String = ""
    @State private var ingreseDni : String = ""
    @State private var alert = false
    
    var agregarPacienteViewModel : AgregarPacienteViewModel = AgregarPacienteViewModel()
    @EnvironmentObject var sharedViewModel : SharedViewModel
    
    
    var body: some View {
        VStack{
            Image("Paciente")
                .resizable()
                .scaledToFit()
            
            Spacer()
            
            HStack{
                Text("Nombre: ")
                TextField("****", text: $ingreseNombre)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            
            HStack{
                Text("Apellido: ")
                TextField("****", text: $ingreseApellido)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            
            HStack{
                Text("Caso: ")
                TextField("****", text: $ingreseCaso)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            
            HStack{
                Text("Edad: ")
                TextField("****", text: $ingreseEdad)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            
            HStack{
                Text("Dni: ")
                TextField("****", text: $ingreseDni)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            
            Button {
                sharedViewModel.guardarNombre(nombre: ingreseNombre)
                sharedViewModel.guardarApellido(apellido: ingreseApellido)
                sharedViewModel.guardarCaso(caso: ingreseCaso)
                sharedViewModel.guardarEdad(edad: Int(ingreseEdad)!)
                sharedViewModel.guardarDni(dni: Int(ingreseDni)!)
                
                Task{
                    await agregarPacienteViewModel.crearPaciente(
                        id: UUID(),
                        nombre:ingreseNombre,
                        apellido:ingreseApellido,
                        caso:ingreseCaso,
                        edad:Int(ingreseEdad)!,
                        dni:Int(ingreseDni)!
                    )
                }
                alert = true
            } label: {
                Text("Registrar".uppercased())
                    .font(.largeTitle)
                    .padding()
                    .background(Color.black)
                    .foregroundColor(Color.white)
                    .cornerRadius(10)
                    .shadow(radius: 10)
            }
            .alert("Paciente Agregado", isPresented: $alert) {
                Button("OK", role: .cancel) { }
            }
        }
        .padding()
        .navigationTitle("DATOS DEL PACIENTE")
        .background(Color("ColorFondoPrincipal"))
    }
}

struct AgregarPacienteView_Previews: PreviewProvider {
    static var previews: some View {
        AgregarPacienteView()
    }
}
