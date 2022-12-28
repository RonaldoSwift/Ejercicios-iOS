//
//  SharedViewModel.swift
//  Ejercicios-iOS
//
//  Created by Ronaldo on 22/12/22.
//

import Foundation

class SharedViewModel: ObservableObject {
    @Published var nombre: String = ""
    @Published var apellido: String = ""
    @Published var dni: Int = 0
    @Published var edad: Int = 0
    
    func guardarNombre(nombre: String){
        self.nombre = nombre
    }
    
    func guardarApellido(apellido: String){
        self.apellido = apellido
    }
    
    func guardarDni(dni: Int){
        self.dni = dni
    }
    
    func guardarEdad(edad: Int){
        self.edad = edad
    }
}
