//
//  SharedViewModel.swift
//  Ejercicios-iOS
//
//  Created by Ronaldo on 5/01/23.
//

import Foundation

class SharedViewModel: ObservableObject {
    @Published var nombre: String = ""
    @Published var apellido: String = ""
    @Published var caso: String = ""
    @Published var dni: Int = 0
    @Published var edad: Int = 0
    
    func guardarNombre(nombre: String){
        self.nombre = nombre
    }
    
    func guardarApellido(apellido: String){
        self.apellido = apellido
    }
    
    func guardarCaso(caso: String){
        self.caso = apellido
    }
    
    func guardarDni(dni: Int){
        self.dni = dni
    }
    
    func guardarEdad(edad: Int){
        self.edad = edad
    }
}
