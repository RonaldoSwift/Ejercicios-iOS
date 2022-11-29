//
//  RegistrarAlumnoView.swift
//  Ejercicios-iOS
//
//  Created by Ronaldo Andre Vargas Huaman on 25/11/22.
//

import Foundation
import SwiftUI

struct RegistrarAlumnoView: View{
    @State private var nombreDeEstudiante: String = ""
    @State private var codigo: String = ""
    let registrarAlumnoViewModel : RegistrarAlumnoViewModel = RegistrarAlumnoViewModel()

    var body: some View{
        VStack{
            
            Text("REGISTRO DE ALUMNO")
            Spacer()
            HStack{
                Text("Nombre: ")
                TextField("Juan****", text: $nombreDeEstudiante)
            }
            HStack{
                Text("Codigo: ")
                TextField("ejm: N00223366", text: $codigo)
            }
            
            HStack{
                Button {
                    Task{
                        await registrarAlumnoViewModel.crearCliente(nombre: nombreDeEstudiante, codigo: codigo)
                    }
                } label: {
                    Text("Registrar")
                        .padding()
                        .foregroundColor(Color.black)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                
                Button {
                    Task{
                        await registrarAlumnoViewModel.obtenerTodosLosAlumnos()
                    }
                } label: {
                    Text("Mostrar")
                        .padding()
                        .foregroundColor(Color.black)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
            }
        }
        .padding()
        .background(Color.yellow)
    }
}


struct RegistrarAlumnoView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrarAlumnoView()
    }
}
