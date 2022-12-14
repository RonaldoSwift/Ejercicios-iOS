//
//  SharedViewModel.swift
//  Ejercicios-iOS
//
//  Created by Ronaldo on 9/12/22.
//

import Foundation

class SharedViewModel: ObservableObject {
    
    @Published var dni: String = ""
    @Published var nombre: String = ""
    @Published var direccion: String = ""
    @Published var distrito: String = ""
    
    func guardarDni(dni: String) {
        self.dni = dni
    }
    
    func guardarNombre(nombre: String){
        self.nombre = nombre
    }
    
    func guardarDireccion(direccion: String){
        self.direccion = direccion
    }
    
    func guardarDistrito(distrito: String){
        self.distrito = distrito
    }
    
}
