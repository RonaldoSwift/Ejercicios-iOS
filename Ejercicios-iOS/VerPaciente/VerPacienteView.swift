//
//  VerPacienteView.swift
//  Ejercicios-iOS
//
//  Created by Ronaldo on 29/12/22.
//

import SwiftUI

struct VerPacienteView: View {
    
    var verPacienteViewModel : VerPacienteViewModel = VerPacienteViewModel()
    
    @State private var pacientes : [Paciente] = []
    
    var body: some View {
        VStack{
            if #available(iOS 16.0, *) {
                
                if(pacientes.count > 0){
                    List{
                        ForEach(pacientes, id: \.id){ (paciente : Paciente) in
                            celdaDePaciente(paciente: paciente)
                        }
                    }
                    .scrollContentBackground(.hidden)
                    .navigationTitle("Reporte De Pacientes")
                }
                else{
                    Spacer()
                    Text("No se encontraron resultados")
                    Spacer()
                }
            } else {
                // Fallback on earlier versions
            }
        }
        .task{
            let descripcionDePaciente = await verPacienteViewModel.obtenerTodosLosPacientes()
            pacientes = descripcionDePaciente
        }
        .padding()
        .background(Color("ColorFondoPrincipal"))
        .navigationTitle("REGISTRO DE PACIENTE")
    }
    
    private func celdaDePaciente(paciente: Paciente) -> some View{
        return HStack{
            NavigationLink {
                EditarPacienteView(paciente: paciente)
            } label: {
                Text("ID: \(paciente.id) \nNombre: \(paciente.nombre) \nApellido: \(paciente.apellido) \nCaso: \(paciente.caso) \nEdad: \(paciente.edad) \nDni: \(paciente.dni)")
            }
            Image("Tacho")
                .resizable()
                .scaledToFit()
                .frame(width: 30,height: 30)
                .onTapGesture {
                    Task{
                        await verPacienteViewModel.eliminarPaciente(paciente.id)
                        pacientes = await verPacienteViewModel.obtenerTodosLosPacientes()
                    }
                }
        }
    }
}

struct VerPacienteView_Previews: PreviewProvider {
    static var previews: some View {
        VerPacienteView()
    }
}
