//
//  Paciente.swift
//  Ejercicios-iOS
//
//  Created by Ronaldo on 29/12/22.
//

import Foundation

struct Paciente: Identifiable{
    
    var id : UUID
    var nombre : String
    var apellido : String
    var caso : String
    var edad : Int
    var dni : Int
    
}
